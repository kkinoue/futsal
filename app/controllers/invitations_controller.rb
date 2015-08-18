class InvitationsController < ApplicationController

  def index
    @event = Event.find(params[:id])
    @invitations = @event.invitations
  end

  def create
    @event = Event.find(params[:id])
    @invitation = @event.invitations.build(user_id: current_user.id)

    if params[:attendance]
      @invitation.attend
    elsif params[:absence]
      @invitation.be_absent
    end

    @invitation.comment = params[:invitation][:comment]

    if @invitation.save
      redirect_to :back
    end

  end

  def update
    @invitation = Invitation.find(params[:id])

    if params[:attendance]
      @invitation.attend
    elsif params[:absence]
      @invitation.be_absent
    end

    @invitation.comment = params[:invitation][:comment]

    if @invitation.save
      redirect_to :back
    end

  end

end
