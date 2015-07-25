# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string
#  starttime   :datetime
#  location    :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  endtime     :datetime
#

class Event < ActiveRecord::Base
  # タイトルは必須
  validates :title, presence: true
end
