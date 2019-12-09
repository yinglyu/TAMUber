recur_events = event.recur(params[:start], params[:end])
json.array! recur_events do |recur_event|
  date_format = '%Y-%m-%dT%H:%M:%S'
  json.id event.id
  json.type 'multiColAgenda'
  json.title event.title
  json.start recur_event.strftime(date_format)
  json.end (recur_event+event.duration).strftime(date_format)
  json.driver_id event.driver_id unless event.driver_id.blank?
  json.frequency event.frequency
  json.allDay false
  json.update_url event_path(event, method: :patch)
  json.edit_url edit_event_path(event)
  json.column $col[event.driver_id]
end