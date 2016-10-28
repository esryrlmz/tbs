class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  #### Devise Ayarları
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #### İlişkiler
  has_many :roles
  has_many :advisors
  has_many :assistant_consultants
  # has_many :club_board_of_directors
  # has_many :club_board_of_supervisory

  #### İmage Uploader
  mount_uploader :image, ImageUploader

  #### Rol Kontrolleri
  def admin?
    roles.where(role_type_id: RoleType.find_by(name: "Admin")).present? ? true : false
  end

  def advisor?(club_period_id=self.active_club_periods())
    if self.vice_advisor?(club_period_id)
      advisor = Role.find_by(club_period_id: club_period_id, role_type_id: RoleType.find_by(name: "Akademik Danışman"), status: true).user
      if advisor.is_passive.present? && advisor.is_passive
        roles.where(club_period_id: club_period_id, role_type_id: RoleType.find_by(name: "Akademik Danışman Yardımcısı"), status: true).present? ? true : false
      else
        roles.where(club_period_id: club_period_id, role_type_id: RoleType.find_by(name: "Akademik Danışman"), status: true).present? ? true : false
      end
    else
      roles.where(club_period_id: club_period_id, role_type_id: RoleType.find_by(name: "Akademik Danışman"), status: true).present? ? true : false
    end
  end

  def vice_advisor?(club_period_id=self.active_club_periods())
    roles.where(club_period_id: club_period_id, role_type_id: RoleType.find_by(name: "Akademik Danışman Yardımcısı"), status: true).present? ? true : false
  end

  def president?(club_period_id=self.active_club_periods())
    roles.where(club_period_id: club_period_id, role_type_id: RoleType.find_by(name: "Başkan"), status: true).present? ? true : false
  end

  def member?(club_period_id=self.active_club_periods())
    roles.where(club_period_id: club_period_id, role_type_id: RoleType.find_by(name: "Üye"), status: true).present? ? true : false
  end

  def owner_of_role?(role)
    self.id == role.user.id ? true : false
  end

  def active_club_periods
    self.roles.present? && self.roles.map { |role| role.club_period if role.club_period.present? && role.club_period.academic_period.is_active}.uniq
  end

  def president_or_advisor_club_period
    if !self.admin? && (self.president? || self.advisor?)
      self.roles.select{ |role| role.club_period.academic_period.is_active && (role.role_type.name == "Başkan" || role.role_type.name == "Akademik Danışman") }.first.club_period
    end
  end

  #### Yardımcı Fonksiyonlar
  def full_name
    if is_academic?
      degree+" "+first_name+" "+last_name
    else
      user_name+" / "+first_name+" "+last_name
    end
  end
  def name_surname
    first_name+" "+last_name
  end
end

