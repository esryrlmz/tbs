class EventResponse < ActiveRecord::Base
  belongs_to :event
  belongs_to :event_status

  attr_accessor :event_reponse_status
end
