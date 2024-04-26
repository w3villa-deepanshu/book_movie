module ApplicationHelper

	def check_date(date)
		Date.today < date
	end

	def check_time(date, time)
		Date.today >= date && time.strftime("%H:%M") < Time.now.strftime("%H:%M") 
	end

	def available_seats(show)
		show.seats.where(booked: false).count
	end

	def default_img
    "https://static.pexels.com/photos/7096/people-woman-coffee-meeting.jpg"
  end

  def movie_image(movie)
  	rails_blob_path(movie.image)
  end

  def movie_name(movie)
  	movie&.name
  end

  def movie_language(movie)
  	movie.language
  end

  def show_date(show)
  	show.show_date
  end

  def show_start_time(show)
  	show.start_time
  end

  def booking_total(booking)
  	booking.total_price
  end


end
