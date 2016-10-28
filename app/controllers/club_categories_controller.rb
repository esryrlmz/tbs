class ClubCategoriesController < ApplicationController
  before_action :set_club_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  # GET /club_categories
  # GET /club_categories.json
  def index
    @club_categories = ClubCategory.all
    authorize @club_categories
  end

  # GET /club_categories/1
  # GET /club_categories/1.json
  def show
  end

  # GET /club_categories/new
  def new
    @club_category = ClubCategory.new
    authorize @club_category
  end

  # GET /club_categories/1/edit
  def edit
  end

  # POST /club_categories
  # POST /club_categories.json
  def create
    @club_category = ClubCategory.new(club_category_params)
    authorize @club_category
    respond_to do |format|
      if @club_category.save
        format.html { redirect_to @club_category, notice: 'Topluluk kategorisi başarıyla oluşturuldu.' }
        format.json { render :show, status: :created, location: @club_category }
      else
        format.html { render :new }
        format.json { render json: @club_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /club_categories/1
  # PATCH/PUT /club_categories/1.json
  def update
    authorize @club_category
    respond_to do |format|
      if @club_category.update(club_category_params)
        format.html { redirect_to @club_category, notice: 'Topluluk kategorisi başarıyla güncellendi.' }
        format.json { render :show, status: :ok, location: @club_category }
      else
        format.html { render :edit }
        format.json { render json: @club_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /club_categories/1
  # DELETE /club_categories/1.json
  def destroy
    authorize @club_category
    @club_category.destroy
    respond_to do |format|
      format.html { redirect_to club_categories_url, notice: 'Topluluk kategorisi başarıyla silindi.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club_category
      @club_category = ClubCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_category_params
      params.require(:club_category).permit(:name)
    end
end
