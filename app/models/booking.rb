class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :show
  has_one :movie, through: :show
  has_one :payment

  enum status: { pending: 0, canceled: 1, booked: 2}

  def seats
    show.seats.where(id: seat_ids)
  end
end
