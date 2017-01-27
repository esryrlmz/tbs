class Event < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  mount_uploader :attachment, FileUploader
  belongs_to :event_category
  belongs_to :club_period
  has_many :event_responses
  belongs_to :faculty

  attr_accessor :event_locations
  scope :admin_pending_events, -> { where(event_status_id: EventStatus.admin_pending_status_ids) }
  scope :advisor_pending_events, -> { where(event_status_id: EventStatus.advisor_pending_status_ids) }
  scope :president_pending_events, -> { where(event_status_id: EventStatus.president_pending_status_ids) }
  scope :dean_pending_events, -> { where(event_status_id: EventStatus.dean_pending_status_ids) }
  scope :approval_events, -> { where(event_status_id: EventStatus.approval_status_ids) }

  def self.member_club_events(current_user)
    current_user.active_club_periods.compact.map { |clubperiod| Event.where(id: clubperiod.events.select { |event| event.id if event.event_responses.any? && event.event_responses.last.event_status_id == 2 }.compact) }.flatten
  end
end
