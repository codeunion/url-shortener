require "rails_helper"

RSpec.describe SessionsController, :type => :routing do
  describe "routing" do

    it "routes to login" do
      expect(:get => "/login").to route_to("sessions#new")
    end

    it "routes to logout" do
      expect(:get => "/logout").to route_to("sessions#destroy")
    end

    it "routes to #create" do
      expect(:post => "/sessions").to route_to("sessions#create")
    end

  end
end