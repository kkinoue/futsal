# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  starttime   :datetime         not null
#  location    :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  endtime     :datetime         not null
#

class Event < ActiveRecord::Base
  # 必須項目
  validates :title, presence: true
  validates :starttime, presence: true
  validates :endtime, presence: true
end
