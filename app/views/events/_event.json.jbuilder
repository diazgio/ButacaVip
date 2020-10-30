json.extract! event, :id, :location, :description, :creator_id, :created_at, :updated_at
json.url event_url(event, format: :json)
