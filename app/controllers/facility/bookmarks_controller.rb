class Facility::BookmarksController < ApplicationController
  def create
    @facility = PublicFacility.find(params[:facility_id])
    current_user.bookmark(@facility)
    render partial: 'facility/bookmarks/bookmark_button', locals: { facility: @facility }
  end

  def destroy
    @facility = current_user.bookmark_facilities.find(params[:facility_id])
    current_user.unbookmark(@facility)
    render partial: 'facility/bookmarks/bookmark_button', locals: { facility: @facility }
  end
end
