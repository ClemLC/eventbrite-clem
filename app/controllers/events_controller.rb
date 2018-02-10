class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.creator=current_user
    if @event.save
      flash.now[:notice] = 'votre événement a bien été créé !'
      redirect_to event_path(@event)
    else
      render 'new'
    end
  end

  def show
   @event = Event.find(params[:id])
    if logged_in?
      render 'show'
    else
      flash[:danger] = 'Vous devez vous connecter pour accéder à l\'événement'
      redirect_to login_path
    end
  end

  def index
    @events = Event.all
  end

  private
  def event_params
    params.require(:event).permit(:description, :date, :place)
  end
end
