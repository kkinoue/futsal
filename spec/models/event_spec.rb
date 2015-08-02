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

require 'rails_helper'

RSpec.describe Event, type: :model do

  let(:event) { Event.new(title:'タイトル',
                          start_time:'2015/7/19 18:00',
                          end_time:'2015/7/19 20:00',
                          location:'foobar',
                          description:'foobar') }
  subject { event }

  it { should respond_to(:title) }
  it { should respond_to(:start_time) }
  it { should respond_to(:end_time) }
  it { should respond_to(:location) }
  it { should respond_to(:description) }

  context 'タイトルの入力がない場合' do
    before { event.title = '' }
    it { should_not be_valid }
  end

  context '開始時間の入力がない場合' do
    before { event.start_time = '' }
    it { should_not be_valid }
  end

  context '終了時間の入力がない場合' do
    before { event.end_time = '' }
    it { should_not be_valid }
  end

  # context '開始時間よりも終了時間のほうが先の場合' do
  #   before { event.start_time = '2015/7/19 20:00', event.end_time = '2015/7/19 18:00' }
  #   it { should_not be_valid }
  # end

  describe 'テーブルの制約' do
    it { should have_not_null_constraint_on(:title) }
    it { should have_not_null_constraint_on(:start_time) }
    it { should have_not_null_constraint_on(:end_time) }
  end

end
