require 'lib/navigate_by_id'
class SchedulesController < ApplicationController
  before_filter :authenticate_user!
  include SetUpDown
  set_up_down Schedule, 'plan'

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

  #def up
    #@schedule = Schedule.find(params[:id])
    #if @up_schedule = Schedule.find_by_plan_date(@schedule.plan_date.yesterday)
      #@up_schedule.update_attribute(:plan_date, @schedule.plan_date)
      #@schedule.update_attribute(:plan_date, @schedule.plan_date.yesterday)
    #end
    #redirect_to @schedule.plan
  #end

  #def down
    #@schedule = Schedule.find(params[:id])
    #if @down_schedule = Schedule.find_by_plan_date(@schedule.plan_date.next)
      #@down_schedule.update_attribute(:plan_date, @schedule.plan_date)
      #@schedule.update_attribute(:plan_date, @schedule.plan_date.next)
    #end
    #redirect_to @schedule.plan
  #end

  def create
    @plan = Plan.find(params[:id])

    if @plan.schedules == [] #如果是第一个日程，schedule日期=plan日期
      @schedule = @plan.schedules.new
      @schedule.plan_date = @schedule.plan.start_off_date
    else #如果不是第一个日程，schedule日期=最后一个schedule日期的后一天
      @schedule = @plan.schedules.new
      @schedule.plan_date = @plan.schedules.last.plan_date.next
    end

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
