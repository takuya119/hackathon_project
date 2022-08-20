class Facility::RepliesController < ApplicationController
  def new
    @comment = FacilityComment.find(params[:comment_id])
    @reply = FacilityReply.new
  end

  def create
    @comment = FacilityComment.find(params[:comment_id])
    @reply = @comment.facility_replies.new(reply_params)
    unless @reply.save
      render partial: 'facility/replies/reply_form', locals: { comment: @comment, reply: @reply }
    end
  end

  def destroy
  end

  private

  def reply_params
    params.require(:facility_reply).permit(:name, :content)
  end
end
