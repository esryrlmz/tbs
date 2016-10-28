# encoding: utf-8

class HomePolicy < ApplicationPolicy
  def index?
  	 true
  end

  def dashboardAdmin?
    @user.admin?
  end

  def dashboardAdvisor?
    @user.advisor?
  end

  def dashboardClub?
    @user.president?
  end
end