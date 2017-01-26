class EventResponseController < ApplicationController
  def create
    @event_response = EventResponse.new(event_response_params)
    # authorize @event_response
   @event = Event.find(event_response_params['event_id'])
    if @event_response.save
      if event_response_params['event_status_id'] == '5'
        if @event.club_period.club.club_category.name == "Mesleki Topluluk"
          EventResponse.create(event_id: event_response_params['event_id'], event_status_id: 8)
          EventMailer.approval_to_event(@event.faculty.role.user, @event).deliver_now unless @event.faculty.blank? #dekana mail gidiyor
        else
          EventResponse.create(event_id: event_response_params['event_id'], event_status_id: 1)
          EventMailer.approval_admin_event(@event).deliver_now #akademik danışmandan adminlere mail gidiyor
        end
      elsif event_response_params['event_status_id'] == '7'
        EventResponse.create(event_id: event_response_params['event_id'], event_status_id: 1)
        EventMailer.approval_admin_event(@event).deliver_now #dekandan adminlere mail gidiyor
      end
      flash.now[:error] = 'Başarılı'
      redirect_to :back
    else
      flash.now[:error] = 'Başarısız'
      render :back
    end
  end

  def destroy
  end

  private

  def event_response_params
    params.fetch(:event_response, {}).permit(:event_id, :event_status_id, :explanation)
  end
end
