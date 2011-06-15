class AttractionsController < ApplicationController
  def info
    @attraction = Attraction.find(params[:id])
    ActiveRecord::Base.include_root_in_json = false
    render :json => @attraction
  end
end
