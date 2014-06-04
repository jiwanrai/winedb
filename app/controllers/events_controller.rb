class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @event
    else
      render 'edit'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  def destroy
    Event.find(params[:id]).destroy
    flash[:success] = "Event deleted."
    redirect_to events_url
  end

  private

    def event_params
      params.require(:event).permit(:name,:description,:date,:wine_ids => [])
    end
end
