class Event::ParticipationsController < ApplicationController
  before_action :require_login

  def create
    @event = Event.find(params[:event_id])
    current_user.participants.create!(event: @event)
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:event_id])
    current_user.participants.find_by(event_id: @event.id).destroy!
    redirect_to @event, status: :see_other
  end
end
