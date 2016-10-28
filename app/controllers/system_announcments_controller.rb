class SystemAnnouncmentsController < ApplicationController
  before_action :set_system_announcment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  # GET /system_announcments
  # GET /system_announcments.json
  def index
    if params[:search]
      @system_announcments = SystemAnnouncment.search(params[:search]).order("created_at DESC")
    else
      @system_announcments = SystemAnnouncment.order("created_at DESC")
    end
    #@system_announcments = SystemAnnouncment.all
    authorize @system_announcments
  end

  # GET /system_announcments/1
  # GET /system_announcments/1.json
  def show
    @system_announcments = SystemAnnouncment.where(is_view: true).limit(3).order("created_at DESC")
    authorize @system_announcment
  end

  # GET /system_announcments/new
  def new
    @system_announcment = SystemAnnouncment.new
    authorize @system_announcment
  end

  # GET /system_announcments/1/edit
  def edit
  end

  # POST /system_announcments
  # POST /system_announcments.json
  def create
    @system_announcment = SystemAnnouncment.new(system_announcment_params)
    authorize @system_announcment
    respond_to do |format|
      if @system_announcment.save
        format.html { redirect_to @system_announcment, notice: 'Sistem duyurusu başarıyla oluşturuldu.' }
        format.json { render :show, status: :created, location: @system_announcment }
      else
        format.html { render :new }
        format.json { render json: @system_announcment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /system_announcments/1
  # PATCH/PUT /system_announcments/1.json
  def update
    authorize @system_announcment
    respond_to do |format|
      if @system_announcment.update(system_announcment_params)
        format.html { redirect_to @system_announcment, notice: 'Sistem duyurusu başarıyla güncellendi.' }
        format.json { render :show, status: :ok, location: @system_announcment }
      else
        format.html { render :edit }
        format.json { render json: @system_announcment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /system_announcments/1
  # DELETE /system_announcments/1.json
  def destroy
    @system_announcment.destroy
    authorize @system_announcment
    respond_to do |format|
      format.html { redirect_to system_announcments_url, notice: 'Sistem duyurusu başarıyla silindi.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_system_announcment
      @system_announcment = SystemAnnouncment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def system_announcment_params
      params.require(:system_announcment).permit(:title, :content, :is_view)
    end
end
