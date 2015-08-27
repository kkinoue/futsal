require 'rails_helper'

RSpec.describe "Static pages", type: :request do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('ホーム画面') }
    it { should have_title('Futsal') }
  end

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

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title('About Us')
    click_link "Help"
    expect(page).to have_title('ヘルプ')
    click_link "Contact"
    expect(page).to have_title('コンタクト')
    click_link "ホーム"
    click_link "ユーザー登録"
    expect(page).to have_title('ユーザー登録')
    click_link "Futsal"
    expect(page).to have_title('Futsal')
  end
end