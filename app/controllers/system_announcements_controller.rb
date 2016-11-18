class SystemAnnouncementsController < ApplicationController
  before_action :set_system_announcement, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  def index
    @system_announcements =
      if params[:search]
        SystemAnnouncement.search(params[:search]).order('created_at DESC')
      else
        SystemAnnouncement.order('created_at DESC')
      end
    authorize @system_announcements
  end

  def show
    @system_announcements = SystemAnnouncement.where(is_view: true).limit(3).order('created_at DESC')
    authorize @system_announcement
  end

  def new
    @system_announcement = SystemAnnouncement.new
    authorize @system_announcement
  end

  def edit
  end

  def create
    @system_announcement = SystemAnnouncement.new(system_announcement_params)
    authorize @system_announcement
    respond_to do |format|
      if @system_announcement.save
        format.html { redirect_to @system_announcement, notice: 'Sistem duyurusu başarıyla oluşturuldu.' }
        format.json { render :show, status: :created, location: @system_announcement }
      else
        format.html { render :new }
        format.json { render json: @system_announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @system_announcement
    respond_to do |format|
      if @system_announcement.update(system_announcement_params)
        format.html { redirect_to @system_announcement, notice: 'Sistem duyurusu başarıyla güncellendi.' }
        format.json { render :show, status: :ok, location: @system_announcement }
      else
        format.html { render :edit }
        format.json { render json: @system_announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @system_announcement.destroy
    authorize @system_announcement
    respond_to do |format|
      format.html { redirect_to system_announcments_url, notice: 'Sistem duyurusu başarıyla silindi.' }
      format.json { head :no_content }
    end
  end

  private

  def set_system_announcement
    @system_announcement = SystemAnnouncement.find(params[:id])
  end

  def system_announcement_params
    params.require(:system_announcement).permit(:title, :content, :is_view)
  end
end
