class Event::RepliesController < ApplicationController
  def new
    @comment = EventComment.find(params[:comment_id])
    @reply = EventReply.new
  end

  def create
    @comment = EventComment.find(params[:comment_id])
    @reply = @comment.event_replies.new(reply_params)
    @reply.user = current_user
    unless @reply.save
      render partial: 'event/replies/reply_form', locals: { comment: @comment, reply: @reply }
    end
  end

  def destroy
  end

  private

  def reply_params
    params.require(:event_reply).permit(:name, :content)
  end
end
