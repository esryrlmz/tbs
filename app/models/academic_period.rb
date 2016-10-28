class AcademicPeriod < ActiveRecord::Base
	 has_many :club_periods

  def self.academic_periods_excep(academic_period)
    where.not(id: academic_period)
  end
end
