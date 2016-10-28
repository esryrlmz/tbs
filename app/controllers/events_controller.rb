class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :event_responses]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    if current_user.present? && current_user.admin?
      @events = Event.all
      # Admin ve Akademik Danışman onayı bekleyen etkinlikler
      @pending_events = Event.select{|event| event.event_responses.any? && (event.event_responses.last.event_status_id == 1 || event.event_responses.last.event_status_id == 4 || event.event_responses.last.event_status_id == 5)}
      @clubs_of_member_events = []
      @club_events = []
    elsif current_user.present? && current_user.advisor?
      club_period = ClubPeriod.find_by(id: current_user.active_club_periods.select{ |club_period| club_period.id if current_user.advisor?(club_period) })
      @events = Event.select{|event| event.event_responses.any? && event.event_responses.last.event_status_id == 2}
      @pending_events = club_period.events.select{|event| event.event_responses.any? && event.event_responses.last.event_status_id != 2 && event.event_responses.last.event_status_id == 4}
      @clubs_of_member_events = []
      @club_events = []
    elsif current_user.present? && current_user.president?
      club_period = ClubPeriod.find_by(id: current_user.active_club_periods.select{ |club_period| club_period.id if current_user.president?(club_period) })
      @events = Event.select{|event| event.event_responses.any? && event.event_responses.last.event_status_id == 2}
      @club_events = club_period.events.select{|event| event.event_responses.any? && event.event_responses.last.event_status_id == 2}
      @pending_events = club_period.events.select{|event| event.event_responses.any? && (event.event_responses.last.event_status_id != 2 || event.event_responses.last.event_status_id == 5)}
      @clubs_of_member_events = current_user.active_club_periods.map{ |club_period| Event.where(id: club_period.events.select{ |event| event.id if event.event_responses.any? && event.event_responses.last.event_status_id == 2 }.compact)}.flatten
    elsif current_user.present? && current_user.member?
      @clubs_of_member_events = current_user.active_club_periods.map{ |club_period| Event.where(id: club_period.events.select{ |event| event.id if event.event_responses.any? && event.event_responses.last.event_status_id == 2 }.compact)}.flatten
      @club_events = []
      @pending_events = []
      @events = []
    else
      @events = Event.select{|event| event.event_responses.any? && event.event_responses.last.event_status_id == 2}
      @club_events = []
      @pending_events = []
      @clubs_of_member_events = []
    end
    events = (@events if @events.any?) || (@clubs_of_member_events if @clubs_of_member_events.any?) || (@club_events if @club_events.any?) || (@pending_events if @pending_events.any?) || []
    authorize Event.where(id: events.map{ |event| event.id })
  end

  def event_responses
    event_responses = @event.event_responses.order('created_at DESC').order('id DESC')
    respond_to do |format|
      format.json { render :json => event_responses, :include => :event_status }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    authorize @event
  end

  # GET /events/new
  def new
    @event = Event.new
    authorize @event
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    authorize @event

    # Aktif/Pasif durumunu burda da kontrol et
    # Pundit ayarlamalarını yap (event/eventlocation)

    respond_to do |format|
      if @event.save
        # Akademik Danışman Onayı Bekleniyor
        event_response = EventResponse.create(event_id: @event.id, event_status_id: 4)
        if event_response
          format.html { redirect_to @event, notice: 'Etkinlik başarıyla oluşturuldu.' }
          format.json { render :show, status: :created, location: @event }
        else
          @event.destroy
          format.html { render :new }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    authorize @event
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Etkinlik başarıyla güncellendi.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    authorize @event
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Etkinlik başarıyla silindi.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.fetch(:event, {}).permit(:club_period_id, :event_category_id, :title, :speakers, :datetime, :location, :content, :requirements, :image, :attachment, :is_admin_confirmation_ok, :is_advisor_confirmation_ok)
    end
end
