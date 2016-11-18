class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  require 'rest-client'
  has_many :roles, dependent: :destroy
  has_many :advisors
  has_many :assistant_consultants
  has_one  :profile, dependent: :destroy
  # has_many :club_board_of_directors
  # has_many :club_board_of_supervisory

  mount_uploader :image, ImageUploader

  def admin?
    roles.any? { |r| r.role_type_id == RoleType.find_by_name('Admin').id }
  end

  def advisor?(club_period_id = active_club_periods)
    @role_type_id = RoleType.find_by_name('Akademik Danışman').id
    if vice_advisor?(club_period_id)
      advisor = Role.where(club_period_id: club_period_id, role_type_id: @role_type_id, status: true).first.user
      if advisor.is_passive.present? && advisor.is_passive
        roles.where(club_period_id: club_period_id, role_type_id: @role_type_id, status: true).present? ? true : false
      else
        roles.where(club_period_id: club_period_id, role_type_id: @role_type_id, status: true).present? ? true : false
      end
    else
      roles.where(club_period_id: club_period_id, role_type_id: @role_type_id, status: true).present? ? true : false
    end
  end

  def vice_advisor?(club_period_id = active_club_periods)
    @role_type_id = RoleType.find_by_name('Akademik Danışman Yardımcısı').id
    roles.where(club_period_id: club_period_id, role_type_id: @role_type_id, status: true).present? ? true : false
  end

  def president?(club_period_id = active_club_periods)
    @role_type_id = RoleType.find_by_name('Başkan').id
    roles.where(club_period_id: club_period_id, role_type_id: @role_type_id, status: true).present? ? true : false
  end

  def member?(club_period_id = active_club_periods)
    @role_type_id = RoleType.find_by_name('Üye').id
    roles.where(club_period_id: club_period_id, role_type_id: @role_type_id, status: true).present? ? true : false
  end

  def owner_of_role?(role)
    id == role.user.id ? true : false
  end

  def active_club_periods
    roles.present? && roles.map { |role| role.club_period if role.club_period.present? && role.club_period.academic_period.is_active }.uniq
  end

  def president_or_advisor_club_period
    return nil unless president? || advisor?
    roles.select { |role| role.club_period.academic_period.is_active && (role.role_type.name == 'Başkan' || role.role_type.name == 'Akademik Danışman') }.first.club_period
  end

  #### Yardımcı Fonksiyonlar
  def full_name
    if is_academic?
      degree + ' ' + first_name + ' ' + last_name
    else
      user_name + ' / ' + first_name + ' ' + last_name
    end
  end

  def crime?
    profile.crime ? 'Disiplin Cezası Var, Topluluklara Üye Olamaz' : 'Disiplin Cezası Yok, Topluluklara Üye Olabilir'
  end

  def name_surname
    first_name + ' ' + last_name
  end
end
