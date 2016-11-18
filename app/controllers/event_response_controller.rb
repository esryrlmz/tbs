class EventResponseController < ApplicationController
  def create
    @event_response = EventResponse.new(event_response_params)
    # authorize @event_response

    if @event_response.save
      if event_response_params['event_status_id'] == '5'
        EventResponse.create(event_id: event_response_params['event_id'], event_status_id: 1)
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
