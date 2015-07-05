require 'rails_helper'

RSpec.describe "UserPages", type: :request do

  describe "user_pages" do
    it "should visit user index page" do
      get users_url
      expect(response).to have_http_status(200)
    end
  end

end
