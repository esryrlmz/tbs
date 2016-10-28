class ClubSettingsController < ApplicationController
  before_action :set_club_setting, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  # GET /club_settings
  # GET /club_settings.json
  def index
    @club_settings = ClubSetting.all
    authorize @club_settings
  end

  # GET /club_settings/1
  # GET /club_settings/1.json
  def show
  end

  # GET /club_settings/new
  def new
    @club_setting = ClubSetting.new
    authorize @club_setting
  end

  # GET /club_settings/1/edit
  def edit
  end

  # POST /club_settings
  # POST /club_settings.json
  def create
    @club_setting = ClubSetting.new(club_setting_params)
    authorize @club_setting
    respond_to do |format|
      if @club_setting.save
        format.html { redirect_to @club_setting, notice: 'Topluluk ayarları başarıyla oluşturuldu.' }
        format.json { render :show, status: :created, location: @club_setting }
      else
        format.html { render :new }
        format.json { render json: @club_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /club_settings/1
  # PATCH/PUT /club_settings/1.json
  def update
    authorize @club_setting
    respond_to do |format|
      if @club_setting.update(club_setting_params)
        format.html { redirect_to @club_setting, notice: 'Topluluk ayarları başarıyla güncellendi.' }
        format.json { render :show, status: :ok, location: @club_setting }
      else
        format.html { render :edit }
        format.json { render json: @club_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /club_settings/1
  # DELETE /club_settings/1.json
  def destroy
    @club_setting.destroy
    authorize @club_setting
    respond_to do |format|
      format.html { redirect_to club_settings_url, notice: 'Topluluk ayarları başarıyla silindi.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club_setting
      @club_setting = ClubSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_setting_params
      params.require(:club_setting).permit(:club_id, :max_user, :is_active, :program_id)
    end
end
