class Facility::FacilitiesController < ApplicationController
  def index
  end

  def show
    @public_facility = PublicFacility.find(params[:id])
    @rooms = @public_facility.rooms
    @comments = @public_facility.facility_comments # orderを検討
    @facility_comment = FacilityComment.new
  end

  def bookmarks
  end
end
