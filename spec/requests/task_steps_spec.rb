require 'rails_helper'

RSpec.describe "TaskSteps", type: :request do
  describe "GET /task_steps" do
    it "works! (now write some real specs)" do
      get task_steps_path
      expect(response).to have_http_status(200)
    end
  end
end
