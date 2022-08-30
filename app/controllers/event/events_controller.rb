class Event::EventsController < ApplicationController
  before_action :set_event, only: %i[edit update]

  def index
    @q = Event.ransack(params[:q])
    # ページネーション検討
    @events = @q.result(distinct: true).includes(:user).order(created_at: :desc)
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
    @number_of_participants = @event.participants.count
  end

  def edit; end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
  end

  def mine
  end

  private

  def event_params
    params.require(:event).permit(:name, :start_time, :end_time, :detail, :capacity, :status)
  end

  def set_event
    @event = current_user.events.find(params[:id])
  end
end
