class ClubCategory < ActiveRecord::Base
  has_many :clubs

  def vocational_club?
    name == 'Mesleki Topluluk'
  end
end
