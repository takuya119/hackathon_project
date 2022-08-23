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
    if @event.save!
      redirect_to events_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
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
