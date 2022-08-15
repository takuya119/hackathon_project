class Facility::BookmarksController < ApplicationController
  def create
    facility = PublicFacility.find(params[:facility_id])
    current_user.bookmark(facility)
    redirect_to facility_path(facility)
  end

  def destroy
    facility = current_user.bookmark_facilities.find(params[:facility_id])
    current_user.unbookmark(facility)
    redirect_to facility_path(facility)
  end
end
