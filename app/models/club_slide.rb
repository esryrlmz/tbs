class ClubSlide < ActiveRecord::Base
  mount_uploader :file, ImageUploader
  belongs_to :club
end
