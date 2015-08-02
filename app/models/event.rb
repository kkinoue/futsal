# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  start_time  :datetime         not null
#  location    :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  end_time    :datetime         not null
#  create_id   :integer
#

class Event < ActiveRecord::Base
  # 必須項目
  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  # validate  :start_end_check

  private

    # def start_end_check
    #   return unless start_time && end_time
    #
    #   if end_time < start_time.to_datetime
    #     errors.add(:end_time, "の日付を正しく記入して下さい。")
    #   end
    # end
end
