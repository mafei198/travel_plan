class BaggageListsController < ApplicationController
  def chouse
    @plan = Plan.find(params[:id])
    @baggage_list = @plan.baggage_list

    if @baggage_list == nil or @baggage_list.baggage_list_empty?
      render :json => {:success => true, 
                       :content => render_to_string(:partial => 'form.html', 
                                                    :locals => {:plan => @plan})
      }
    else
      render :json => {:success => true, 
                       :content => render_to_string(:partial => 'show.html', 
                                                    :locals => {:baggage_list => @baggage_list})
      }
    end
  end

  def show
    @baggage_list = BaggageList.find(params[:id])
    respond_to :js
  end

  def create
    @plan = Plan.find(params[:plan_id])
    @baggage_list = BaggageList.new(prepare_baggage_list_hash)
    if @baggage_list.save
      respond_to :js
    else
      redirect_to chouse
    end
  end

  def update
  end

  def edit
    @plan = BaggageList.find(params[:id]).plan
    respond_to :js
  end

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
