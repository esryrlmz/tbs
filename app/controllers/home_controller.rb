class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:dashboardAdmin, :dashboardAdvisor, :dashboardClub]
  def index
    @events = Event.order("created_at DESC").last(3)
    @system_announcments = Event.order("created_at DESC").last(3)
  end
  def dashboardAdmin
  end
  def dashboardAdvisor
  end
  def dashboardPresident
  end
end
