class JourneysController < ApplicationController
  include JourneysHelper
  before_filter :authenticate_user!
  set_up_down Journey, 'schedule'

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

    if @journey.save
      @schedule = Schedule.find(params[:dayid])
      @plan = @schedule.plan

      if @journey.journey_type == 'scenic'
        attraction = Attraction.find_by_name(@journey.name)
        @plan.plan_attractions.create(:attraction_id => attraction.id)
      end

      content = render_to_string( :partial => 'journey.html', 
                                  :locals  => { :schedule => @schedule, 
                                                :plan     => @plan })

      render :json => { "success" => true, 
                        "costs"   => schedule_costs(@schedule), 
                        "content" => content, 
                        "dayid"   => @journey.schedule_id }
    else
      render :json => { "success" => false }
    end
  end

  def update

  end

  def destroy
    @journey = Journey.find(params[:id])
    if @journey.journey_type == 'scenic'
      attraction = Attraction.find_by_name(@journey.name)
      PlanAttraction.find_by_attraction_id(attraction.id).destroy
    end
    if @journey.destroy
      render :json => {:success => true}
    else
      render :json => {:success => false}
    end
  end
end
