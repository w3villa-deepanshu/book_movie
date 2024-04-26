class PaymentService
  def self.process_payment(booking, user, payment_intent)
    payment = Payment.new(
      status: Payment.statuses["paid"],
      total_payment: payment_intent.amount.to_i,
      payment_type: :card,
      booking_id: booking.id,
      user_id: user.id
    )
    payment.save ? [true, payment] : [false, payment]
  end
end
