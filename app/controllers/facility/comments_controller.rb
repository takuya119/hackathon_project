class Facility::CommentsController < ApplicationController
  def create
    facility = PublicFacility.find(params[:facility_id])
    comment = facility.facility_comments.new(comment_params)
    if comment.save
      redirect_to facility_path(facility)
    # else # 失敗処理は後で
    #   render 'facility/facilities/show', status: :unprocessable_entity
    end
  end

  def destroy # 現状コメントは消さない
  end

  private

  def comment_params
    params.require(:facility_comment).permit(:name, :content)
  end
end
