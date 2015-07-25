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

require 'rails_helper'

RSpec.describe Event, type: :model do

  let(:event) { Event.new(title:'タイトル',
                          datetime:'2015/7/19 18:00',
                          place:'foobar',
                          memo:'foobar') }
  subject { user }

end
