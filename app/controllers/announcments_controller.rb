class AnnouncmentsController < ApplicationController
  before_action :set_announcment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  # GET /announcments
  # GET /announcments.json
  def index
    if current_user.admin?
      @announcments = Announcment.all
    elsif current_user.advisor?
      club_period = ClubPeriod.find_by(id: current_user.active_club_periods.select{ |club_period| club_period.id if current_user.advisor?(club_period) })
      @announcments= club_period.nil? ? [] : Announcment.where(club_period_id: club_period.id)
    elsif current_user.president?
      club_period = ClubPeriod.find_by(id: current_user.active_club_periods.select{ |club_period| club_period.id if current_user.president?(club_period) })
      @announcments= club_period.nil? ? [] : Announcment.where(club_period_id: club_period.id)
    else
      @announcments = Announcment.all
    end 
    if @announcments.nil? || @announcments.empty?
      authorize Announcment
    else 
      authorize @announcments
    end
  end

  # GET /announcments/1
  # GET /announcments/1.json
  def show
    authorize @announcment
  end

  # GET /announcments/new
  def new
    @announcment = Announcment.new
    authorize @announcment
  end

  # GET /announcments/1/edit
  def edit
  end

  # POST /announcments
  # POST /announcments.json
  def create
    @announcment = Announcment.new(announcment_params)
    authorize @announcment
    respond_to do |format|
      if @announcment.save
        format.html { redirect_to @announcment, notice: 'Duyuru başarıyla oluşturuldu.' }
        format.json { render :show, status: :created, location: @announcment }
      else
        format.html { render :new }
        format.json { render json: @announcment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /announcments/1
  # PATCH/PUT /announcments/1.json
  def update
    authorize @announcment
    respond_to do |format|
      if @announcment.update(announcment_params)
        format.html { redirect_to @announcment, notice: 'Duyuru başarıyla güncellendi.' }
        format.json { render :show, status: :ok, location: @announcment }
      else
        format.html { render :edit }
        format.json { render json: @announcment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /announcments/1
  # DELETE /announcments/1.json
  def destroy
    authorize @announcment
    @announcment.destroy
    respond_to do |format|
      format.html { redirect_to announcments_url, notice: 'Duyuru başarıyla silindi.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_announcment
      @announcment = Announcment.find(params[:id])
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def announcment_params
      params.require(:announcment).permit(:club_period_id, :title, :content, :is_view, :is_advisor_confirmation)
    end
end
