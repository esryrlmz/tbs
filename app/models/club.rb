class Club < ActiveRecord::Base
	 mount_uploader :logo, ImageUploader
	 belongs_to :club_category
	 has_one :club_contact, dependent: :destroy 
	 has_one :club_setting, dependent: :destroy
	 has_many :club_periods, dependent: :destroy
	 has_many :users, through: :roles_users
	 has_many :club_slides

	 def self.search(query)
     # where(:title, query) -> This would return an exact match of the query
    where("lower(name) like ?", "%#{query}%".downcase) 
   	end

  def active_club_period
 		 self.club_periods.find_by(academic_period_id: AcademicPeriod.find_by(is_active: true))
 	end
end
