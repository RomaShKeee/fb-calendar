class EventsController < ApplicationController

  def index
    SyncEventsApiJob.perform_later
    @events = Match.all
  end

  def show
    @event = Match.find(params[:id])
  end  
end
