class SchedulesController < ApplicationController
  before_filter :authenticate_user!

  def up
    @schedule = Schedule.find(params[:id])
    plan = @schedule.plan
    order_list = plan.schedule_order_list.to_s.split(',')
    order_list.each_with_index do |order,i|
      if order == @schedule.id.to_s && i != 0
        order_list[i], order_list[i-1] = order_list[i-1], order_list[i]
        if plan.update_attribute(:schedule_order_list, order_list.join(','))
          render :json => {"success" => true, "swapid" => order_list[i]}
        else
          render :json => {"success" => false, "error" => "服务器忙请稍后再试!"}
        end
        break
      elsif order == @schedule.id.to_s && i == 0
        render :json => {"success" => false, "error" => "已经排在第一个了!"}
      end
    end
  end

  def down
    @schedule = Schedule.find(params[:id])
    plan = @schedule.plan
    order_list = plan.schedule_order_list.to_s.split(',')
    order_list.each_with_index do |order,i|
      if ((order == @schedule.id.to_s) && (i != (order_list.size - 1)))
        order_list[i], order_list[i+1] = order_list[i+1], order_list[i]
        if plan.update_attribute(:schedule_order_list, order_list.join(','))
          render :json => {"success" => true, "swapid" => order_list[i]}
        else
          render :json => {"success" => false, "error" => "服务器忙请稍后再试!"}
        end
        break
      elsif order == @schedule.id.to_s && i == 0
        render :json => {"success" => false, "error" => "已经排在第一个了!"}
      end
    end
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      if @schedule.update_attributes(params[:schedule])
        format.html { redirect_to @schedule.plan, :notice => '日程更新成功！' }
      else
        render 'edit'
      end
    end
  end

  def create
    @schedule = Schedule.new(:plan_id => params[:id])

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule.plan, :notice => '日程创建成功！' }
      else
        format.html { redirect_to @schedule.plan, :notice => '创建日志失败！'}
      end
    end
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy

    respond_to do |format|
      format.html { redirect_to @schedule.plan }
    end
  end
end
