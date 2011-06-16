class JourneysController < ApplicationController
  before_filter :authenticate_user!

  def up
    @journey= journey.find(params[:id])
    schedule = @journey.schedule
    order_list = schedule.journey_order_list.to_s.split(',')
    order_list.each_with_index do |order,i|
      if order == @journey.id.to_s && i != 0
        order_list[i], order_list[i-1] = order_list[i-1], order_list[i]
        order_list.join(',')
        schedule.update_attribute(:journey_order_list, order_list)
        break
      end
    end
    redirect_to schedule.plan
  end

  def down
    @journey= journey.find(params[:id])
    schedule = @journey.schedule
    order_list = schedule.journey_order_list.to_s.split(',')
    order_list.each_with_index do |order,i|
      if ((order == @journey.id.to_s) && (i != (order_list.size - 1)))
        order_list[i], order_list[i+1] = order_list[i+1], order_list[i]
        order_list.join(',')
        schedule.update_attribute(:journey_order_list, order_list)
        break
      end
    end
    redirect_to plan
  end

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
      render :json => {
                        "success" => true,
                        "costs"   => @journey.budget, 
                        "content" => render_to_string(:partial => 'journey.html', 
                                                     :locals => {:schedule => @schedule}), 
                        "dayid"   => @journey.schedule_id }
    else
      render :json => { "success" => false }
    end
  end

  def update

  end

  def destroy

  end

end
