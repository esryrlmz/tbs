class Role < ActiveRecord::Base
  belongs_to :role_type
  belongs_to :club_period
  belongs_to :user
  def rol_name
    if club
      if club_exception
        role_type.name+" - "+club.name+" / "+club_exception.academic_period.name
      else
        role_type.name+" - "+club.name
      end
    else
      role_type.name
    end
  end
end
