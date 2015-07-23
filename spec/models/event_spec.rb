require 'rails_helper'

RSpec.describe Event, type: :model do

  let(:event) { Event.new(title:'タイトル',
                          datetime:'2015/7/19 18:00',
                          place:'foobar',
                          memo:'foobar') }
  subject { user }

end
