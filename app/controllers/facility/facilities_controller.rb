class Facility::FacilitiesController < ApplicationController
  def index
  end

  def show
    console # デバッグ用
    login(User.first.email, 'password') # デバッグ用

    @public_facility = PublicFacility.find(params[:id])
    @rooms = @public_facility.rooms
  end

  def bookmarks
  end
end
