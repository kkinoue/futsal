require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { FactoryGirl.create(:user) }
  subject { user }

  describe '属性' do
    it { should respond_to(:name) }
    it { should respond_to(:email_address) }

    context 'when name is not present' do
      before { user.name = '' }
      it { should_not be_valid }
    end

    context 'when email_address is not present' do
      before { user.email_address = '' }
      it { should_not be_valid }
    end

    describe 'テーブルの制約' do
      it { should have_not_null_constraint_on(:name) }
      it { should have_not_null_constraint_on(:email_address) }
    end
  end

end
