class FacultiesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard_admin, :dashboard_advisor, :dashboard_club]

  def index
    @faculties = Faculty.all
  end

  def update
    @faculty = Faculty.find(params[:id])
    @faculty.name = params[:faculty][:name]
    @faculty.save
    redirect_to :back
  end

  def create
    @faculty = Faculty.new
    @faculty.name = params[:faculty][:name]
    @faculty.save
    redirect_to :back
  end

  def destroy
    @faculty = Faculty.find(params[:id])
    @faculty.destroy
    redirect_to :back
  end

end
