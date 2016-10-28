class AcademicPeriodsController < ApplicationController
  before_action :set_academic_period, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /academic_periods
  # GET /academic_periods.json
  def index
    @academic_periods = AcademicPeriod.all
    authorize @academic_periods
  end

  # GET /academic_periods/1
  # GET /academic_periods/1.json
  def show
    authorize @academic_period
  end

  # GET /academic_periods/new
  def new
    @academic_period = AcademicPeriod.new
    authorize @academic_period
  end

  # GET /academic_periods/1/edit
  def edit
    authorize @academic_period
  end

  # POST /academic_periods
  # POST /academic_periods.json
  def create
    @academic_period = AcademicPeriod.new(academic_period_params)
    authorize @academic_period

    respond_to do |format|
      if @academic_period.save
        format.html { redirect_to @academic_period, notice: 'Akademik dönem başarıyla oluşturuldu.' }
        format.json { render :show, status: :created, location: @academic_period }
      else
        format.html { render :new }
        format.json { render json: @academic_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /academic_periods/1
  # PATCH/PUT /academic_periods/1.json
  def update
    authorize @academic_period
    respond_to do |format|
      if @academic_period.update(academic_period_params)
        if @academic_period.is_active
          academic_periods_excep = AcademicPeriod.academic_periods_excep(@academic_period)
          academic_periods_excep.update_all(:is_active => false)
          Club.all.each do |club|
            unless club.club_periods.find_by(academic_period_id: @academic_period.id).present?
              ClubPeriod.create(club_id: club.id, academic_period_id: @academic_period.id)
            end
          end
        end
        format.html { redirect_to @academic_period, notice: 'Akademik dönem başarıyla güncellendi.' }
        format.json { render :show, status: :ok, location: @academic_period }
      else
        format.html { render :edit }
        format.json { render json: @academic_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /academic_periods/1
  # DELETE /academic_periods/1.json
  def destroy
    authorize @academic_period
    @academic_period.destroy
    respond_to do |format|
      format.html { redirect_to academic_periods_url, notice: 'Akademik dönem başarıyla silindi.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_academic_period
      @academic_period = AcademicPeriod.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def academic_period_params
      params.require(:academic_period).permit(:name, :is_active)
    end
end
