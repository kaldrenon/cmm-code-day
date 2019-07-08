require 'rails_helper'

RSpec.describe TaskStepsController, type: :controller do
  let(:user) { User.first || create(:user) }

  before do
    @ts = create(:task_step)
  end

  let(:valid_session) { { user_id: user.id } }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      task_step = @ts
      get :show, params: {id: task_step.to_param}, session: valid_session
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
      task_step = @ts
      get :edit, params: {id: task_step.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new TaskStep" do
        expect {
          post :create, params: {task_step: @ts.attributes}, session: valid_session
        }.to change(TaskStep, :count).by(1)
      end

      it "redirects to the created task_step" do
        post :create, params: {task_step: @ts.attributes}, session: valid_session
        expect(response).to redirect_to(TaskStep.last)
      end
    end

  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested task_step" do
        task_step = @ts
        put :update, params: {id: task_step.to_param, task_step: @ts.attributes}, session: valid_session
        task_step.reload
        expect(task_step).to eq @ts
      end

      it "redirects to the task_step" do
        task_step = @ts
        put :update, params: {id: task_step.to_param, task_step: @ts.attributes}, session: valid_session
        expect(response).to redirect_to(task_step)
      end
    end

  end

  describe "DELETE #destroy" do
    it "destroys the requested task_step" do
      task_step = @ts
      expect {
        delete :destroy, params: {id: task_step.to_param}, session: valid_session
      }.to change(TaskStep, :count).by(-1)
    end

    it "redirects to the task_steps list" do
      task_step = @ts
      delete :destroy, params: {id: task_step.to_param}, session: valid_session
      expect(response).to redirect_to(task_steps_url)
    end
  end
end
