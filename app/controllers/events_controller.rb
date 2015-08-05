class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = 'イベント作成完了'
      redirect_to @event
    else
      render 'new'
    end
  end

  private
    def event_params
      params.require(:event).permit(
        :title, :location, :description, :start_time, :end_time
      )
    end
end
