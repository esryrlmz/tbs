class ClubPeriodsController < ApplicationController
  before_action :set_club_period, only: [:show, :edit, :update, :destroy, :member_list]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  # GET /club_periods
  # GET /club_period.json
  def index
    @club_periods = ClubPeriod.where(academic_period_id: AcademicPeriod.find_by(is_active: true))
    authorize @club_periods
  end

  def member_list
    @member_list = @club_period.club_members.map { |role| role.user }
    respond_to do |format|
      format.json { render :json => @member_list }
    end
  end

  # GET /club_periods/1
  # GET /club_periods/1.json
  def show
  end

  # GET /club_periods/new
  def new
    @club_period = ClubPeriod.new
    authorize @club_period
  end

  # GET /club_periods/1/edit
  def edit
  end

  # POST /club_periods
  # POST /club_period.json
  def create
    @club_period = ClubPeriod.new(club_period_params)
    authorize @club_period
    respond_to do |format|
      if @club_period.save
        format.html { redirect_to @club_period, notice: 'Topluluk dönemi başarıyla oluşturuldu.' }
        format.json { render :show, status: :created, location: @club_period }
      else
        format.html { render :new }
        format.json { render json: @club_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /club_periods/1
  # PATCH/PUT /club_periods/1.json
  def update
    authorize @club_period
    respond_to do |format|
      if @club_period.update(club_period_params)
        format.html { redirect_to @club_period, notice: 'Topluluk dönemi başarıyla düncellendi.' }
        format.json { render :show, status: :ok, location: @club_period }
      else
        format.html { render :edit }
        format.json { render json: @club_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /club_periods/1
  # DELETE /club_periods/1.json
  def destroy
    @club_period.destroy
    authorize @club_period
    respond_to do |format|
      format.html { redirect_to club_periods_url, notice: 'Topluluk dönemi başarıyla silindi.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club_period
      @club_period = ClubPeriod.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_period_params
      params.require(:club_period).permit(:club_id, :name, :is_active, :academic_period_id)
    end
end
