require "rails_helper"

RSpec.describe TaskStepsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/task_steps").to route_to("task_steps#index")
    end

    it "routes to #new" do
      expect(:get => "/task_steps/new").to route_to("task_steps#new")
    end

    it "routes to #show" do
      expect(:get => "/task_steps/1").to route_to("task_steps#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/task_steps/1/edit").to route_to("task_steps#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/task_steps").to route_to("task_steps#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/task_steps/1").to route_to("task_steps#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/task_steps/1").to route_to("task_steps#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/task_steps/1").to route_to("task_steps#destroy", :id => "1")
    end
  end
end
