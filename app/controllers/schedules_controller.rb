class SchedulesController < ApplicationController
  before_filter :authenticate_user!

  def up
    @schedule = Schedule.find(params[:id])
    if swapid = @schedule.move_higher
      render :json => {:success => true, :swapid => swapid }
    else
      render :json => {:success => false}
    end
  end

  def down
    @schedule = Schedule.find(params[:id])
    if swapid = @schedule.move_lower
      render :json => {:success => true, :swapid => swapid }
    else
      render :json => {:success => false}
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
        @plan = @schedule.plan
        @schedules = @plan.list
        format.js
        #format.html { redirect_to @schedule.plan, :notice => '日程创建成功！' }
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
