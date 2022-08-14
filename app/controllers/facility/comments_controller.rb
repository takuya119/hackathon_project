class Facility::CommentsController < ApplicationController
  def create
    public_facility = PublicFacility.find(params[:facility_id])
    facility_comment = public_facility.facility_comments.new(comment_params)
    if facility_comment.save
      redirect_to facility_path(public_facility)
    # else # 失敗処理は一旦検討
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
