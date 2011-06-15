class JourneysController < ApplicationController
  before_filter :authenticate_user!
  set_up_down Journey

  def go_to

  end

  def new
    
  end

  def create
    @journey = Journey.new(:schedule_id => params[:dayid])
    @journey.journey_type = params[:linktype]
    @journey.name = params[:title]
    @journey.description = params[:description]
    @journey.budget = params[:costs]
    @journey.from_to = params[:starts] + '~' + params[:ends]
    @schedule = Schedule.find(params[:dayid])

    if @journey.save
      render :json => {"costs"   => @journey.budget, 
                       "content" => render_to_string(:partial => 'journey.html', 
                                                     :locals => {:schedule => @schedule}), 
                       "dayid"   => @journey.schedule_id}
    else

    end
  end

  def update

  end

  def destroy

  end

end
