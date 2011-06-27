class AttractionsController < ApplicationController
  def info
    @attraction = Attraction.find(params[:id])
    ActiveRecord::Base.include_root_in_json = false
    render :json => { :name        => @attraction.name,
                      :description => @attraction.description,
                      :costs       => '',
                      :link_id     => @attraction.id }
  end
end
