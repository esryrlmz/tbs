class Event < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  mount_uploader :attachment, FileUploader
  belongs_to :event_category
  belongs_to :club_period
  has_many :event_responses

  attr_accessor :event_locations
end
