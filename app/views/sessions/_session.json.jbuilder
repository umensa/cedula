json.extract! session, :id, :topic, :mentor_id, :start_time, :end_time, :created_at, :updated_at
json.url session_url(session, format: :json)
