class AttractionsController < ApplicationController
  def info
    @attraction = Attraction.find(params[:id])

    #ActiveRecord::Base.include_root_in_json = false
    h = {:title => @attraction.name, :price => "", :description => @attraction.description, :linktype => "", :linkid => ""}
    render :json => h.to_json
  end
end
