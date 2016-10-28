class ClubBoardOfDirectorsController < ApplicationController
  before_action :set_club_board_of_director, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  # GET /club_board_of_directors
  # GET /club_board_of_directors.json
  def index
    @club_board_of_directors = ClubBoardOfDirector.all
    authorize @club_board_of_directors
  end

  # GET /club_board_of_directors/1
  # GET /club_board_of_directors/1.json
  def show
  end

  # GET /club_board_of_directors/new
  def new
    @club_board_of_director = ClubBoardOfDirector.new
    authorize @club_board_of_director
  end

  # GET /club_board_of_directors/1/edit
  def edit
  end

  # POST /club_board_of_directors
  # POST /club_board_of_directors.json
  def create
    @club_board_of_director = ClubBoardOfDirector.new(club_board_of_director_params)
    club_period = ClubPeriod.find(club_board_of_director_params["club_period_id"])
    if ClubBoardOfDirector.where(club_period_id: club_period.id).any?
      flash.now[:error] = "Daha önce bu topluluk için Yönetim Kurulu oluşturulmuş. Lütfen onu düzenleyiniz."
      render :new
    else
      if duplicated_user_names = get_duplicated_user_names(club_period) 
        flash.now[:error] = "#{duplicated_user_names} başka bir toplulukta yönetim kurulunda ya denetim kurulunda."
        render :new
      else
        authorize @club_board_of_director
        respond_to do |format|
          if @club_board_of_director.save
            format.html { redirect_to @club_board_of_director, notice: 'Yönetim kurulu başarıyla oluşturuldu.' }
            format.json { render :show, status: :created, location: @club_board_of_director }
          else
            format.html { render :new }
            format.json { render json: @club_board_of_director.errors, status: :unprocessable_entity }
          end
        end
      end
    end
  end

  # PATCH/PUT /club_board_of_directors/1
  # PATCH/PUT /club_board_of_directors/1.json
  def update
    authorize @club_board_of_director
    club_period = ClubPeriod.find(club_board_of_director_params["club_period_id"])
    if duplicated_user_names = get_duplicated_user_names(club_period, "update") 
      flash.now[:error] = "#{duplicated_user_names} başka bir toplulukta yönetim kurulunda ya denetim kurulunda."
      render :new
    else
      respond_to do |format|
        if @club_board_of_director.update(club_board_of_director_params)
          format.html { redirect_to @club_board_of_director, notice: 'Yönetim kurulu başarıyla güncellendi.' }
          format.json { render :show, status: :ok, location: @club_board_of_director }
        else
          format.html { render :edit }
          format.json { render json: @club_board_of_director.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /club_board_of_directors/1
  # DELETE /club_board_of_directors/1.json
  def destroy
    @club_board_of_director.destroy
    authorize @club_board_of_director
    respond_to do |format|
      format.html { redirect_to club_board_of_directors_url, notice: 'Yönetim kurulu başarıyla silindi.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club_board_of_director
      @club_board_of_director = ClubBoardOfDirector.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_board_of_director_params
      params.require(:club_board_of_director).permit(:club_period_id, :president_id, :vice_president_id, :accountant_id, :secretary_id, :member_one, :member_two, :member_three)
    end

    # Başka toplulukta yönetim kulurunda ya da denetim kurulunda olanların tespiti
    def get_duplicated_user_names(club_period, action="")
      all_club_board_of_supervisories = ClubBoardOfSupervisory.where(id: ClubBoardOfSupervisory.select{ |cbos| cbos.id if cbos.club_period.academic_period.is_active })
      all_club_board_of_directors = ClubBoardOfDirector.where(id: ClubBoardOfDirector.select{ |cbod| cbod.id if cbod.club_period.academic_period.is_active })
      all_club_board_of_directors_except = action == "update" ? all_club_board_of_directors.where.not(club_period: club_period) : all_club_board_of_directors
      all_board_users = all_club_board_of_supervisories + all_club_board_of_directors_except
      duplicated_users = []
      club_board_of_director_params.each do |attribute,user_id|
        if attribute != "club_period_id"
          duplicated_users.push(User.find(user_id.to_i)) if all_board_users.map{ |club_board| club_board.attributes.except("id", "club_period_id").values.include?(user_id.to_i) }.any?
        end
      end
      # Başka toplulukta yönetim kulurunda ya da denetim kurulunda olan kullanıcılar
      duplicated_users = duplicated_users.uniq
      if duplicated_users.any?
        duplicated_user_names = ""
        duplicated_users.each do |user|
          duplicated_user_names = "#{duplicated_user_names}, #{user.name_surname}"
        end
        duplicated_user_names = duplicated_user_names[1..duplicated_user_names.length]
        return duplicated_user_names
      else
        return false
      end
    end
end
