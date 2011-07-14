class BaggageListsController < ApplicationController
  before_filter :authenticate_user!, :except => [:chouse, :show]

  def chouse
    @plan = Plan.find(params[:id])
    @baggage_list = @plan.baggage_list

    if @baggage_list.baggage_list_empty?
      render 'edit', :locals => {:plan => @plan, :baggage_list => @baggage_list}
    else
      render 'show', :locals => {:baggage_list => @baggage_list}
    end
  end

  def show
    @baggage_list = BaggageList.find(params[:id])
    respond_to :js
  end

  def update
    @baggage_list = BaggageList.find(params[:id])
    if @baggage_list.update_attributes(:checked_items => params[:checked_items].join(','),
                                       :notation      => params[:notation])
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
end
