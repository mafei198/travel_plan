class PlacesController < ApplicationController
  before_filter :authenticate_user!
  def get_attractions
    @place = Place.find(params[:id])
    @attractions = Attraction.get_attractions_by(@place).paginate :page => params[:page], :per_page => 6

    respond_to do |format|
      format.js
    end
  end

  def get_china_citys

    respond_to do |format|
      format.js
    end
  end
end
