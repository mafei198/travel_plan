class BaggageListsController < ApplicationController
  before_filter :authenticate_user!, :except => [:chouse, :show]

  def chouse
    @plan = Plan.find(params[:id])
    @baggage_list = @plan.baggage_list || BaggageList.new(:plan_id => @plan.id)

    if @plan.baggage_list == nil or @baggage_list.baggage_list_empty?
      render 'edit', :locals => {:plan => @plan, :baggage_list => @baggage_list}
    else
      render 'show', :locals => {:baggage_list => @baggage_list}
    end
  end

  def show
    @baggage_list = BaggageList.find(params[:id])
    respond_to :js
  end

  def create
    @baggage_list = BaggageList.new(prepare_baggage_list_hash)
    if @baggage_list.save
      respond_to :js
    else
      redirect_to chouse
    end
  end

  def update
    @baggage_list = BaggageList.find(params[:id])
    if @baggage_list.update_attributes(prepare_baggage_list_hash)
      render 'show', :locals => {:baggage_list => @baggage_list}
    else
      redirect_to @baggage_list.plan
    end
  end

  def edit
    @baggage_list = BaggageList.find(params[:id])
    @plan = @baggage_list.plan
    respond_to :js
  end

  private
  def prepare_baggage_list_hash
    params.each do |key, value|
      if params[key].class != Array and key != "plan_id" 
        params.delete(key)
      else
        params[key] = params[key].join(',') unless key == "plan_id"
      end
    end
    params
  end
end
