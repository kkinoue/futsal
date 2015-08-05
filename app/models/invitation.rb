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
end
