json.array!(@events) do |event|
  json.extract! event, :id
  json.title match_name(event)
  json.description "Match in league #{event.league.name}"
  json.start event.started_at
  json.end event.started_at + 90.minutes
  json.url event_url(event, format: :html)
end

