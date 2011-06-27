class JourneysController < ApplicationController
  include JourneysHelper
  before_filter :authenticate_user!
  set_up_down Journey, 'schedule'

  def go_to

  end

  def new

  end

  def create
    @journey = Journey.new(:schedule_id => params[:schedule_id])
    @journey.link_type = params[:link_type]
    @journey.name = params[:name]
    @journey.description = params[:description]
    @journey.costs = params[:costs]
    @journey.starts = params[:starts]
    @journey.ends = params[:ends]
    @journey.link_id = params[:link_id]

    if @journey.save
      @schedule = Schedule.find(params[:schedule_id])
      @plan = @schedule.plan

      if @journey.link_type == 'scenic'
        attraction = Attraction.find_by_name(@journey.name)
        @plan.plan_attractions.create(:attraction_id => attraction.id)
      end

      content = render_to_string( :partial => 'journey.html', 
                                  :locals  => { :schedule => @schedule, 
                                                :plan     => @plan })

      render :json => { "success" => true, 
                        "costs"   => schedule_costs(@schedule), 
                        "content" => content, 
                        "schedule_id"   => @journey.schedule_id }
    else
      render :json => { "success" => false }
    end
  end

  def update

  end

  def destroy
    @journey = Journey.find(params[:id])
    if @journey.link_type == 'scenic'
      PlanAttraction.find_by_attraction_id(@journey.link_id).destroy
    end
    if @journey.destroy
      render :json => {:success => true}
    else
      render :json => {:success => false}
    end
  end
end
