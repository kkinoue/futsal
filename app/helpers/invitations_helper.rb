module InvitationsHelper

  def attendance_active(invitation)
    if invitation.attendance?
      ' active'
    else
      ''
    end
  end

  def absence_active(invitation)
    if invitation.absence?
      ' active'
    else
      ''
    end
  end

  def panel_color_by_status(invitation)
    if invitation.attendance?
      'success'
    elsif invitation.absence?
      'danger'
    else
      'info'
    end
  end

end
