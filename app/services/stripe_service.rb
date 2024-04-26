class StripeService
  def self.create_or_retrieve_customer(user)
    if user.stripe_customer_id.present?
      Stripe::Customer.retrieve(user.stripe_customer_id)
    else
      customer = Stripe::Customer.create({
        name: user.email,
        email: user.email
      })
      user.update(stripe_customer_id: customer.id)
      customer
    end
  end

  def self.create_payment_intent(user, booking)
    Stripe::PaymentIntent.create({
      customer: user.stripe_customer_id,
      amount: (booking.seat_ids.count * booking.show.price_per_ticket).to_i,
      description: "ticket booking for #{booking.show.movie.name}",
      currency: 'usd',
      automatic_payment_methods: { enabled: true, allow_redirects: 'never' },
      payment_method: 'pm_card_visa',
      confirm: true,
      return_url: 'http://localhost:8000/'
    })
  end
end
