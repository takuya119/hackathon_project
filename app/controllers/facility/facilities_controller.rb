class Facility::FacilitiesController < ApplicationController
  def index
    @q = PublicFacility.ransack(params[:q])
    @facilities = @q.result
    room_tags = Tag.joins(:room_tags).distinct.map{|t| t.name}

    gon.searchInfo = {facilities: @facilities, room_tags: room_tags}
  end

  def show
    @facility = PublicFacility.find(params[:id])
    @rooms = @facility.rooms
    @comments = @facility.facility_comments.includes(:facility_replies) # orderを検討
    @comment = FacilityComment.new
  end

  def bookmarks
  end
end
