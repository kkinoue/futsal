class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @attend_events  = current_user.attend_events
                          .paginate(page: params[:page], :per_page => 10)
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
