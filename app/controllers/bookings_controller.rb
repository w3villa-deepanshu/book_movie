class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy cancel_booking]
  before_action :authenticate_user!
  before_action :check_user_permission, only: %i[ all_bookings ]


  def index
    @bookings = current_user.bookings.booked.joins(:show).order("shows.show_date ASC").paginate(page: params[:page], per_page: 8)
  end

  def show
  end

  def edit
  end

  def all_bookings
    @bookings = Booking.all.paginate(page: params[:page], per_page: 30)
  end

  def new
    @booking = Booking.new
    @show = Show.find(params[:show_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @show = Show.find(params[:booking][:show_id])
    @booking.seat_ids = params[:booking][:seat_ids].reject(&:blank?)
    @booking.total_price = @show.price_per_ticket * @booking.seat_ids.count
    @booking.status = Booking.statuses["pending"]
    respond_to do |format|
      if @booking.save
        format.html { redirect_to new_payment_path(booking_id: @booking.id), notice: "Booking was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def cancel_booking
    @booking = current_user.bookings.find(params[:id])
    @booking.canceled!
    @booking.show.seats.where(id: @booking.seat_ids).update(booked: false)
    redirect_to bookings_path, notice: "Booking canceled successfully."
  end


  private

    def check_user_permission
      permission = current_user.admin
      unless permission
        redirect_to '/', notice: "not authorized"
      end
    end

    def set_booking
      @booking = current_user.bookings.find_by(id: params[:id])
      unless @booking
        redirect_to root_path, notice:"not found"
      end
    end

    def booking_params
      params.require(:booking).permit(:user_id, :total_price, :status, :show_id,  seat_ids: [])
    end
end
