class Facility::CommentsController < ApplicationController
  def create
    @facility = PublicFacility.find(params[:facility_id])
    @comment = @facility.facility_comments.new(comment_params)
    @comment.user = User.find(current_user.id) if current_user
    unless @comment.save
      render partial: 'facility/comments/comment_form', locals: { facility: @facility, comment: @comment, url: facility_comments_path(@facility) }
    end
  end

  def show
    @comment = FacilityComment.find(params[:id])
    render partial: 'facility/comments/comment', locals: { comment: @comment }
  end

  def destroy # 現状コメントは消さない
  end

  private

  def comment_params
    params.require(:facility_comment).permit(:name, :content, :comment_type)
  end
end
