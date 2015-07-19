require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { User.new(name:'user-name',
                        email:'user@mail.com',
                        password:'foobar',
                        password_confirmation:'foobar') }
  subject { user }

  describe '属性' do
    it { should respond_to(:name) }
    it { should respond_to(:email) }
    it { should respond_to(:password_digest) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }

    context 'when name is not present' do
      before { user.name = '' }
      it { should_not be_valid }
    end

    context 'when email is not present' do
      before { user.email = '' }
      it { should_not be_valid }
    end

    describe 'テーブルの制約' do
      it { should have_not_null_constraint_on(:name) }
      it { should have_not_null_constraint_on(:email) }
    end
  end

end
