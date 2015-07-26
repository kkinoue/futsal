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
                          starttime:'2015/7/19 18:00',
                          endtime:'2015/7/19 20:00',
                          location:'foobar',
                          description:'foobar') }
  subject { event }

  it { should respond_to(:title) }
  it { should respond_to(:starttime) }
  it { should respond_to(:endtime) }
  it { should respond_to(:location) }
  it { should respond_to(:description) }

end
