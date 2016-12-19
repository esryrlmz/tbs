# encoding: utf-8

class ProfilePolicy < ApplicationPolicy
  def show?
    @user.admin? || @user.advisor? || @user.president? || @user.vice_advisor?
  end
end
