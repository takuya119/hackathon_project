class Event::CommentsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @comment = @event.event_comments.new(comment_params)
    @comment.user = current_user
    unless @comment.save
      render partial: 'event/comments/comment_form', locals: { event: @event, comment: @comment, url: event_comments_path(@event) }
    end
  end

  def show
    @comment = EventComment.find(params[:id])
    render partial: 'event/comments/comment', locals: { comment: @comment }
  end

  def destroy
  end

  private

  def comment_params
    params.require(:event_comment).permit(:name, :content)
  end
end
