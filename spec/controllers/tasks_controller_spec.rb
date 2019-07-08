require 'rails_helper'
RSpec.describe TasksController, type: :controller do
  let(:user) { User.first || create(:user) }
  let(:task) { Task.first || create(:task_with_steps) }

  let(:valid_session) { { user_id: user.id } }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: task.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: {id: task.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "redirects to the created task" do
        post :create, params: {task: task.attributes}, session: valid_session
        expect(response).to redirect_to(Task.last)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested task" do
        put :update, params: {id: task.to_param, task: task.attributes}, session: valid_session
        task.reload
        expect(task).to eq task
      end

      it "redirects to the task" do
        put :update, params: {id: task.to_param, task: task.attributes}, session: valid_session
        expect(response).to redirect_to(task)
      end
    end
  end

  describe "DELETE #destroy" do
    it "redirects to the tasks list" do
      delete :destroy, params: {id: task.to_param}, session: valid_session
      expect(response).to redirect_to(tasks_url)
    end
  end

end
