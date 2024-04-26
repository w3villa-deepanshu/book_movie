json.extract! booking, :id, :user_id, :seat_ids, :total_price, :status, :show_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
