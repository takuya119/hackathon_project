class Facility::BookmarksController < ApplicationController
  def create
    public_facility = PublicFacility.find(params[:facility_id])
    current_user.bookmark(public_facility)
    redirect_to facility_path(public_facility)
  end

  def destroy
    public_facility = current_user.bookmark_public_facilities.find(params[:facility_id])
    current_user.unbookmark(public_facility)
    redirect_to facility_path(public_facility)
  end
end
