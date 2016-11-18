class EventStatus < ActiveRecord::Base
  has_many :event_responses
end
