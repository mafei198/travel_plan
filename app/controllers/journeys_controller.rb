class JourneysController < ApplicationController
  include JourneysHelper
  before_filter :authenticate_user!

  def up
    @journey= Journey.find(params[:id])
    schedule = @journey.schedule
    order_list = schedule.journey_order_list.to_s.split(',')
    order_list.each_with_index do |order,i|
      if order == @journey.id.to_s && i != 0
        order_list[i], order_list[i-1] = order_list[i-1], order_list[i]
        if schedule.update_attribute(:journey_order_list, order_list.join(','))
          render :json => {"success" => true, "swapid" => order_list[i]}
        else
          render :json => {"success" => false, "error" => "服务器忙请稍后再试!"}
        end
        break
      elsif order == @journey.id.to_s && i == 0
          render :json => {"success" => false, "error" => "已经排在第一个了!"}
      end
    end
  end

  def down
    @journey= Journey.find(params[:id])
    schedule = @journey.schedule
    order_list = schedule.journey_order_list.to_s.split(',')
    order_list.each_with_index do |order,i|
      if ((order == @journey.id.to_s) && (i != (order_list.size - 1)))
        order_list[i], order_list[i+1] = order_list[i+1], order_list[i]
        if schedule.update_attribute(:journey_order_list, order_list.join(','))
          render :json => {"success" => true, "swapid" => order_list[i]}
        else
          render :json => {"success" => false, "error" => "服务器忙请稍后再试!"}
        end
        break
      elsif ((order == @journey.id.to_s) && (i == (order_list.size - 1)))
          render :json => {"success" => false, "error" => "已经是最后一个了!"}
      end
    end
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
    if @journey.save
      @schedule = Schedule.find(params[:dayid])
      render :json => {
        "success" => true,
        "costs"   => schedule_costs(@schedule), 
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
