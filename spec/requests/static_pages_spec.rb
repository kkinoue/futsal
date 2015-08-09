require 'rails_helper'

RSpec.describe "Static pages", type: :request do

  subject { page }

  describe "Help page" do
    before { visit help_path }

    it { should have_content('ヘルプ') }
    it { should have_title('ヘルプ') }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('About') }
    it { should have_title('About Us') }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_content('コンタクト') }
    it { should have_title('コンタクト') }
  end
end