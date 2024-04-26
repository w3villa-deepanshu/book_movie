class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[ show edit update destroy ]

  def new
    @payment = Payment.new
    @booking = Booking.find(params[:booking_id])
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @payment = Payment.new

    begin
      stripe_customer = StripeService.create_or_retrieve_customer(current_user)
      payment_intent = StripeService.create_payment_intent(current_user, @booking)

      if payment_intent.status == "succeeded"
        success, @payment = PaymentService.process_payment(@booking, current_user, payment_intent)
        if success
          redirect_to bookings_path, notice: 'Payment was successfully created.'
        else
          render :new, status: :unprocessable_entity
        end
      else
        flash[:error] = 'Payment failed'
        redirect_to bookings_path, status: :unprocessable_entity
      end
    rescue Stripe::StripeError => e
      flash[:error] = e.message
      redirect_to bookings_path, status: :unprocessable_entity
    end
  end
  

  private
  def set_payment
    @payment = Payment.find(params[:id])
  end

  def payment_params
    params.require(:payment).permit(:status, :total_payment, :booking_id, :user_id, :payment_type)
  end
end
