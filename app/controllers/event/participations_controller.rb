class Event::ParticipationsController < ApplicationController
  before_action :require_login
  before_action :set_event, only: %i[create destroy]

  def create
    current_user.participation(@event)
    redirect_to event_path(@event)
  end

  def destroy
    current_user.unparticipation(@event)
    redirect_to @event, status: :see_other
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
