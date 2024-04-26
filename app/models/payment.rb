class Payment < ApplicationRecord
  belongs_to :booking
  belongs_to :user
  enum status: { pending: 0, paid: 1, failed: 2}
  # enum status: { card: 0 }
  after_save :book_ticket
  after_create :book_seats


  def book_ticket
    booking.booked!
  end

  def book_seats
    booking.show.seats.where(id: booking.seat_ids).update(booked: true)
  end

end
