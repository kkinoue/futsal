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

  context 'タイトルの入力がない場合' do
    before { event.title = '' }
    it { should_not be_valid }
  end

  context '開始時間の入力がない場合' do
    before { event.starttime = '' }
    it { should_not be_valid }
  end

  context '終了時間の入力がない場合' do
    before { event.endtime = '' }
    it { should_not be_valid }
  end

  describe 'テーブルの制約' do
    it { should have_not_null_constraint_on(:title) }
    it { should have_not_null_constraint_on(:starttime) }
    it { should have_not_null_constraint_on(:endtime) }
  end

end
