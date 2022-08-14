class Event::EventsController < ApplicationController
  def index
    @q = Event.ransack(params[:q])
    @events = @q.result(distinct: true).includes(:user).order(created_at: :desc)
  end

  def new
  end

  def create
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
end
