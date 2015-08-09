# == Schema Information
#
# Table name: invitations
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  event_id   :integer
#  status     :string
#  comment    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Invitation < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  def attendance?
    status == '出席'
  end

  def absence?
    status == '欠席'
  end

  def attend
    self.status = '出席'
  end

  def be_absent
    self.status = '欠席'
  end

end
