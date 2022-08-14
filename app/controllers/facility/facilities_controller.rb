class Facility::FacilitiesController < ApplicationController
  def index
  end

  def show
    @facility = PublicFacility.find(params[:id])
    @rooms = @facility.rooms
    @comments = @facility.facility_comments # orderを検討
    @comment = FacilityComment.new
  end

  def bookmarks
  end
end
