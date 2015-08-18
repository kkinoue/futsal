class InvitationsController < ApplicationController

  def index
    @event = Event.find(params[:id])
    @invitations = @event.invitations.includes(:user)
  end

  def edit
    @invitation = Invitation.find(params[:id])
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
