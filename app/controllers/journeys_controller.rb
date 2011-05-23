require 'lib/navigate_by_id'
class JourneysController < ApplicationController
  before_filter :authenticate_user!
  include NavigateById
  set_up_down Journey, Journey.find(params[:id]).schedule.plan

  #def up
    #@journey = Journey.find(params[:id])
    #if @previous_journey = Journey.previous(@journey) != nil
      #@journey.id, @previous_journey.id = @previous_journey.id, @journey.id
      #@journey.save 
      #@previous_journey.save
    #end
    #redirect_to @journey.schedule.plan
  #end

  #def down
    #@journey = Journey.find(params[:id])
    #if @next_journey = Journey.next(@journey) != nil
      #@journey.id, @next_journey = @next_journey.id, @journey.id
      #@journey.save
      #@next_journey.save
    #end
    #redirect_to @journey.schedule.plan
  #end

  def go_to
    
  end

  def create
    
  end

  def update
    
  end

  def destroy
    
  end
  
end
