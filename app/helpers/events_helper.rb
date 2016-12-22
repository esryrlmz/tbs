module EventsHelper
  def calender_event
    Event.all.map { |a| a }.keep_if { |x| x.event_responses.last.event_status_id == 2 }
  end
end
