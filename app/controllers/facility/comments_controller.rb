class Facility::CommentsController < ApplicationController
  def create
    @facility = PublicFacility.find(params[:facility_id])
    @comment = @facility.facility_comments.new(comment_params)
    unless @comment.save
      # turbo_frame_tag 'comment_form'囲んだ部分からリクエストを送ると、
      # レンダリング先にあるturbo_frame_tag 'comment_form'で囲われた部分と差し替えられる。

      # render 'facility/facilities/show'でも同じ挙動になるが、その場合は
      # @roomsや@commentsなどの変数を用意する必要がある。
      render partial: "facility/facilities/comment_form", locals: { facility: @facility, comment: @comment, url: facility_comments_path(@facility) }
    end
  end

  def destroy # 現状コメントは消さない
  end

  private

  def comment_params
    params.require(:facility_comment).permit(:name, :content)
  end
end
