class ProfilesController < ApplicationController
  def show
    @profile = Profile.find_by(user_id: params[:id])
    @member_clubs = @profile.user.roles.map { |x| x.club_period.club } unless @profile.user.roles.nil?
    authorize @profile
  end
end
