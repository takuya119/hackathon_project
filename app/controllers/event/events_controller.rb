class Event::EventsController < ApplicationController
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
    @participation = current_user.participants.find_by(event_id: @event.id)

    @number_of_participants = @event.participants.count
    @comments = @event.event_comments.includes(:event_replies) # orderを検討
    @comment = EventComment.new
  end

  def edit
    @event = current_user.events.find(params[:id])
  end

  def update
    @event = current_user.events.find(params[:id])
    @event.assign_attributes(event_params)
    if @event.save
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
end
