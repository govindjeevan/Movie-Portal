json.extract! booking, :id, :movie_id, :theatre_id, :user_id, :show_id, :seats, :created_at, :updated_at
json.url booking_url(booking, format: :json)
