require "rails_helper"

RSpec.describe ForAttributesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/for_attributes").to route_to("for_attributes#index")
    end

    it "routes to #new" do
      expect(:get => "/for_attributes/new").to route_to("for_attributes#new")
    end

    it "routes to #show" do
      expect(:get => "/for_attributes/1").to route_to("for_attributes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/for_attributes/1/edit").to route_to("for_attributes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/for_attributes").to route_to("for_attributes#create")
    end

    it "routes to #update" do
      expect(:put => "/for_attributes/1").to route_to("for_attributes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/for_attributes/1").to route_to("for_attributes#destroy", :id => "1")
    end

  end
end
