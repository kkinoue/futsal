class EventsController < ApplicationController
  before_action :signed_in_user, only: [:create, :new, :edit, :index, :show]
  before_action :admin_user, only: [:create, :new, :edit]

  def index
    @events = Event.where('start_time > ?', Time.zone.now)
                  .order(:start_time)
                  .paginate(page: params[:page], :per_page => 10)
    @past_events = Event.where('start_time <= ?', Time.zone.now)
                       .order(:start_time)
                        .paginate(page: params[:page], :per_page => 10)

  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @invitation = @event.find_invitation_by_user(current_user)
    @invitation ||= @event.invitations.build(user_id: current_user.id)
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = 'イベントを作成しました'
      redirect_to @event
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:success] = 'イベントを更新しました'
      redirect_to @event
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy!
    flash[:success] = 'イベントを削除しました'
    redirect_to @event
  end

  private
    def event_params
      params.require(:event).permit(
        :title, :location, :description, :start_time, :end_time, :wanted_persons
      )
    end
end
