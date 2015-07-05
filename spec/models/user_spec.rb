require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { User.new }
  subject { user }

  describe '属性' do
    it { should respond_to(:name) }
    it { should respond_to(:email_address) }
  end

end
