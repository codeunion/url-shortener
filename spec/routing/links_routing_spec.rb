require "rails_helper"

RSpec.describe LinksController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/").to route_to("links#index")
    end

    it "routes to #new" do
      expect(:get => "/links/new").to route_to("links#new")
    end

    it "routes to #show" do
      expect(:get => "/l/1").to route_to("links#show", :short_name => "1")
    end

    it "routes to #create" do
      expect(:post => "/links").to route_to("links#create")
    end

  end
end
