class ClubPeriod < ActiveRecord::Base
  belongs_to :academic_period
  has_one :club_board_of_director
  has_one :club_board_of_supervisory
  has_one :advisor
  has_one :assistant_consultant
  has_many :announcements
  has_many :events
  has_many :event_requests
  has_many :roles
  belongs_to :club

  def academic_period_name
    club.name + ' / ' + academic_period.name
  end

  def club_members
    Role.where(id: Role.select { |role| role.id if role.role_type.name != 'Akademik Danışman' && role.role_type.name != 'Akademik Danışman Yardımcısı' && role.club_period_id == id })
  end

  def president
    role = roles.find_by(role_type_id: RoleType.find_by(name: 'Başkan').id)
    role.present? ? role.user : nil
  end

  def advisor
    role = roles.find_by(role_type_id: RoleType.find_by(name: 'Akademik Danışman').id)
    role.present? ? role.user : nil
  end

  def vice_advisor
    role = roles.find_by(role_type_id: RoleType.find_by(name: 'Akademik Danışman Yardımcısı').id)
    role.present? ? role.user : nil
  end
end
