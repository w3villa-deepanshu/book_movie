json.extract! payment, :id, :status, :total_payment, :booking_id, :user_id, :payment_type, :created_at, :updated_at
json.url payment_url(payment, format: :json)
