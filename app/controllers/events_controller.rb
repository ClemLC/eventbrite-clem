class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash.now[:success] = "Hey ! Bienvenu sur Eventbrite by Clem !"
      redirect_to @event
    else
      render 'new'
    end
  end

  private
  def event_params
    params.require(:event).permit(:description, :date, :place)
  end
end
