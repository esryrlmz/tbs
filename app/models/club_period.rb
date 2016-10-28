class ClubPeriod < ActiveRecord::Base
	 belongs_to :academic_period
	 has_one :club_board_of_director
	 has_one :club_board_of_supervisory
	 has_one :advisor
	 has_one :assistant_consultant
	 has_many :announcments
	 has_many :events
	 has_many :event_requests
	 has_many :roles
	 belongs_to :club
	 def academic_period_name
 		 club.name+" / "+academic_period.name
 	end

  def club_members
    Role.where(id: Role.select{ |role| role.id if role.role_type.name != "Akademik Danışman" && role.club_period_id == self.id })
  end

  def president
  	 User.find_by(id: self.roles.map{ |role| role.user.id if role.role_type.name == "Başkan" }.compact)
  end

  def advisor
  	 User.find_by(id: self.roles.map{ |role| role.user.id if role.role_type.name == "Akademik Danışman" }.compact)
  end
end
