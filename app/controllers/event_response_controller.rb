class EventResponseController < ApplicationController
  def create
    @event_response = EventResponse.new(event_response_params)
    # authorize @event_response
    @event = Event.find(event_response_params['event_id'])
    if @event_response.save
      @event.update(event_status_id: event_response_params['event_status_id'].to_i)
      if event_response_params['event_status_id'] == '5'
        @event.club_period.club.club_category.vocational_club? ? event_response_and_send_mail(@event, 8) : event_response_and_send_mail(@event, 1)
      elsif event_response_params['event_status_id'] == '7'
        event_response_and_send_mail(@event, 1)
      end
      flash.now[:error] = 'Başarılı'
    else
      flash.now[:error] = 'Başarısız'
    end
    redirect_to :back
  end

  def destroy
  end

  def event_response_and_send_mail(event, event_status)
    EventResponse.create(event_id: event.id, event_status_id: event_status)
    Event.find(event.id).update(event_status_id: event_status)
    event_status == 1 ? EventMailer.approval_admin_event(event).deliver_now : (EventMailer.approval_to_event(event.faculty.role.user, event).deliver_now unless event.faculty.blank? || event.faculty.role.blank?)
  end

  private

  def event_response_params
    params.fetch(:event_response, {}).permit(:event_id, :event_status_id, :explanation)
  end
end
