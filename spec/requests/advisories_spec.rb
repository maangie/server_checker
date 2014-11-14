require 'rails_helper'

RSpec.describe "Advisories", :type => :request do
  describe "GET /advisories" do
    it "works! (now write some real specs)" do
      get advisories_path
      expect(response).to have_http_status(200)
    end
  end
end
