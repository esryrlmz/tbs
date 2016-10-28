class ClubSlidesController < ApplicationController
  before_action :set_club_slide, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /club_slides
  # GET /club_slides.json
  def index
    @club_slides = ClubSlide.where(club_id: current_user.roles_users.find_by(status: :true, role_id: Role.find_by(role_type_id: RoleType.find_by(name: :advisor))).role.club_id)
    authorize @club_slides
  end

  # GET /club_slides/1
  # GET /club_slides/1.json
  def show
  end

  # GET /club_slides/new
  def new
    @club_slide = ClubSlide.new
    authorize @club_slide
  end

  # GET /club_slides/1/edit
  def edit
  end

  # POST /club_slides
  # POST /club_slides.json
  def create
    @club_slide = ClubSlide.new(club_slide_params)
    authorize @club_slide
    respond_to do |format|
      if @club_slide.save
        format.html { redirect_to @club_slide, notice: "Topluluk slide'ı başarıyla oluşturuldu." }
        format.json { render :show, status: :created, location: @club_slide }
      else
        format.html { render :new }
        format.json { render json: @club_slide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /club_slides/1
  # PATCH/PUT /club_slides/1.json
  def update
    authorize @club_slide
    respond_to do |format|
      if @club_slide.update(club_slide_params)
        format.html { redirect_to @club_slide, notice: "Topluluk slide'ı başarıyla güncellendi." }
        format.json { render :show, status: :ok, location: @club_slide }
      else
        format.html { render :edit }
        format.json { render json: @club_slide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /club_slides/1
  # DELETE /club_slides/1.json
  def destroy
    authorize @club_slide
    @club_slide.destroy
    respond_to do |format|
      format.html { redirect_to club_slides_url, notice: "Topluluk slide'ı başarıyla silindi." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club_slide
      @club_slide = ClubSlide.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_slide_params
      params.require(:club_slide).permit(:file, :title, :club_id)
    end
end
