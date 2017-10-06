json.extract! @event, :id, :created_at, :updated_at
json.title match_name(@event)
json.start @event.started_at
json.end @event.started_at + 90.minutes
