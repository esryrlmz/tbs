class ClubBoardOfSupervisory < ActiveRecord::Base
	 belongs_to :club_period
	 belongs_to :principal_member_first, class_name: 'User', foreign_key: 'principal_member_one'
	 belongs_to :principal_member_second, class_name: 'User', foreign_key: 'principal_member_two'
	 belongs_to :principal_member_third, class_name: 'User', foreign_key: 'principal_member_three'
	 belongs_to :reserve_member_first, class_name: 'User', foreign_key: 'reserve_member_one'
	 belongs_to :reserve_member_second, class_name: 'User', foreign_key: 'reserve_member_two'
	 belongs_to :reserve_member_third, class_name: 'User', foreign_key: 'reserve_member_three'
end
