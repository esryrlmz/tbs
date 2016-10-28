class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  # GET /clubs
  # GET /clubs.json
  def index
    #@clubs = Club.where(:is_active => :true)
    if params[:search]
      @clubs = Club.search(params[:search]).order("name ASC")
    else
      @clubs = Club.order("name ASC")
      @clubs_of_current_user = current_user.present? ? current_user.active_club_periods.map { |club_period| club_period.club if club_period.present?} : []
    end
    authorize @clubs
  end

  # GET /clubs/1
  # GET /clubs/1.json
  def show
    @academic_period_id = AcademicPeriod.find_by(is_active: :true)
    @club_period = @club.active_club_period.present? ? @club.active_club_period : nil
    if user_signed_in? and current_user.member?(@club_period)
      @role = current_user.roles.find_by(club_period_id: @club_period.id)
    else
      @role = Role.new
    end
    @club_view = @club.club_setting.is_active ? true : false
    @club_view_contact = @club.club_contact.present? ? true : false
    if @club_period.present?
      @club_advisor = false
      @club_president = false
      if @club_period.roles.find_by(role_type_id: RoleType.find_by(name: "Akademik Danışman").id).present?
        @club_advisor = @club_period.roles.find_by(role_type_id: RoleType.find_by(name: "Akademik Danışman").id).user
      end
      if @club_period.roles.find_by(role_type_id: RoleType.find_by(name: "Başkan").id).present?
        @club_president = @club_period.roles.find_by(role_type_id: RoleType.find_by(name: "Başkan").id).user
      end
      # binding.pry
      @club_view_board_of_director = @club_period.club_board_of_director.present? ? true : false
      @club_view_board_of_supervisor = @club_period.club_board_of_supervisory.present? ? true : false
      # @club_events = @club_period.events.where(is_view: :true)
      # @club_events = true
      @club_announcments = @club_period.announcments.where(is_view: true)
    end

    @club_members = @club.active_club_period.club_members
    club_members_count = @club_members.nil? ? 0 : @club_members.count
    if club_members_count < (@club.club_setting.nil? ? 150 : @club.club_setting.max_user)
      @club_member_count_error = false
    else
      @club_member_count_error = true
    end
    if user_signed_in? and not current_user.member?(@club_period)
      if @club.club_category.name == "Mesleki Topluluk"
        if @club.club_setting.program_id == current_user.program_code
          @club_member_program_error = false
        else
          @club_member_program_error = true
        end
      else
        @club_member_program_error = false
      end
    end
  end

  # GET /clubs/new
  def new
    @club = Club.new
    authorize @club
  end

  # GET /clubs/1/edit
  def edit
  end

  # POST /clubs
  # POST /clubs.json
  def create
    authorize Club
    @club = Club.new(club_params)
    respond_to do |format|
      if @club.save
        club_period = ClubPeriod.create(club_id: @club.id, academic_period_id: AcademicPeriod.find_by(is_active: true).id)
        club_setting = ClubSetting.create(club_id: @club.id, max_user: 150)
        if club_period && club_setting
          format.html { redirect_to @club, notice: 'Topluluk başarıyla oluşturuldu.' }
          format.json { render :show, status: :created, location: @club }
        else
          @club.destroy
          format.html { render :new }
          format.json { render json: @club.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clubs/1
  # PATCH/PUT /clubs/1.json
  def update
    authorize @club
    respond_to do |format|
      if @club.update(club_params)
        format.html { redirect_to @club, notice: 'Topluluk bilgileri başarıyla güncellendi.' }
        format.json { render :show, status: :ok, location: @club }
      else
        format.html { render :edit }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clubs/1
  # DELETE /clubs/1.json
  def destroy
    authorize @club
    # @club.is_active = false
    # @club.save
    @club.destroy
    respond_to do |format|
      format.html { redirect_to clubs_url, notice: 'Topluluk başarıyla silindi.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_params
      params.require(:club).permit(:name, :short_name, :description, :creation_date, :club_category_id, :logo)
    end
end
