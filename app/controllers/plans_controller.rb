class PlansController < ApplicationController
  autocomplete :place, :name
  before_filter :authenticate_user!, :except => [:home, :index, :show]

  def home
    
  end

  # GET /plans
  # GET /plans.xml
  def index
    @plans = Plan.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @plans }
    end
  end

  # GET /personal_plans
  # GET /personal_plans.xml
  def personal_plans
    @plans = !params[:user] ? current_user.plans : User.find(params[:user]).plans

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @plans }
    end
  end

  # GET /plans/1
  # GET /plans/1.xml
  def show 
    @plan = Plan.find(params[:id])
    @personal_plans = Plan.find_all_by_user_id(@plan.user_id)
    @plan_user = @plan.user
    @attractions = @plan.attractions
    @ordered_schedules = @plan.ordered_schedules

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @plan }
    end
  end

  # GET /plans/new
  # GET /plans/new.xml
  def new
    @plan = current_user.plans.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @plan }
    end
  end

  # GET /plans/1/edit
  def edit
    @plan = current_user.plans.find(params[:id])
  end

  # POST /plans
  # POST /plans.xml
  def create
    plan_hash = prepare_plan_data params[:plan]
    @plan = current_user.plans.new(plan_hash)

    respond_to do |format|
      if @plan.save
        format.html { redirect_to(@plan, :notice => 'Plan was successfully created.') }
        format.xml  { render :xml => @plan, :status => :created, :location => @plan }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /plans/1
  # PUT /plans/1.xml
  def update
    @plan = current_user.plans.find(params[:id])
    plan_hash = prepare_plan_data params[:plan]

    respond_to do |format|
      if @plan.update_attributes(plan_hash)
        format.html { redirect_to(@plan, :notice => 'Plan was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /plans/1
  # DELETE /plans/1.xml
  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy

    respond_to do |format|
      format.html { redirect_to(plans_url) }
      format.xml  { head :ok }
    end
  end

  private
    def prepare_plan_data(plan)
      plan[:places] = Place.find_all_by_name(params[:plan][:places].split(','))
      plan
    end
end
