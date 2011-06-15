class AttractionsController < ApplicationController
  def info
    @attraction = Attraction.find(params[:id])
<<<<<<< HEAD

=======
>>>>>>> 572e968f2a70b67eb06975a2a18d1c8d7b15d617
    ActiveRecord::Base.include_root_in_json = false
    render :json => @attraction
  end
end
