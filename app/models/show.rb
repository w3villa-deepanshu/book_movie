class Show < ApplicationRecord
  belongs_to :movie
  has_many :seats, dependent: :destroy
  after_create :create_seats
  validate :start_and_end_time


  def create_seats
    50.times do |t|
      Seat.create!(seat_no: "#{t+1}", show_id: self.id, booked:false)
    end
  end
  def start_and_end_time
    return if start_time.blank? || end_time.blank?

    starttime = start_time.strftime("%H:%M:%S").split(":").first

    endtime = end_time.strftime("%H:%M:%S").split(":").first

    if endtime <= starttime
      errors.add(:end_time, "must be after the start time")
    end
  end
end
