class PlacesController < ApplicationController
  before_filter :authenticate_user!
  respond_to :js
  def get_attractions
    @place = Place.find(params[:id])
    @attractions = Attraction.get_attractions_by(@place).paginate :page => params[:page], :per_page => 6

  end

  def get_china_citys
  end

end
