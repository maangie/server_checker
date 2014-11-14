require "rails_helper"

RSpec.describe AdvisoriesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/advisories").to route_to("advisories#index")
    end

    it "routes to #new" do
      expect(:get => "/advisories/new").to route_to("advisories#new")
    end

    it "routes to #show" do
      expect(:get => "/advisories/1").to route_to("advisories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/advisories/1/edit").to route_to("advisories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/advisories").to route_to("advisories#create")
    end

    it "routes to #update" do
      expect(:put => "/advisories/1").to route_to("advisories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/advisories/1").to route_to("advisories#destroy", :id => "1")
    end

  end
end
