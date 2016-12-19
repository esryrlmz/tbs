module EventsHelper
  def calender_event
    Event.select { |event| event.event_responses.any? && event.event_responses.last.event_status_id == 2 }
  end
end
