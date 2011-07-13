class JourneysController < ApplicationController
  include JourneysHelper
  before_filter :authenticate_user!

  def up
    @journey = Journey.find(params[:id])
    if swapid = @journey.move_higher
      render :json => {:success => true, :swapid => swapid }
    else
      render :json => {:success => false}
    end
  end

  def down
    @journey = Journey.find(params[:id])
    if swapid = @journey.move_lower
      render :json => {:success => true, :swapid => swapid }
    else
      render :json => {:success => false}
    end
  end

  def new

  end

  def create
    ['authenticity_token', 'utf8', 'controller', 'action'].each{|key|params.delete(key)}
    @journey = Journey.new(params)

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
    schedule_id = @journey.schedule_id

    if @journey.destroy
      if @journey.link_type == 'scenic'
        PlanAttraction.find_by_attraction_id(@journey.link_id).destroy
      end

      @schedule = Schedule.find(schedule_id)
      @plan = @schedule.plan
      @costs = schedule_costs(@schedule)
      @content = render_to_string( :partial => 'journey.html', 
                                  :locals  => { :schedule => @schedule, 
                                                :plan     => @plan })
      respond_to :js
    else
      redirect_to @plan
    end
  end
end
