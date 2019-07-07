require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    before do
      session.delete(:user_id)
      @user = create(:user)
    end

    it "loads a session" do
      expect(@user.username).to eq "testuser"
      expect(@user.password).to eq "testpassword"

      post :create, params: {
        :session => {
          username: 'testuser',
          password: 'testpassword'
        }
      }

      expect(flash[:danger]).to eq nil
      expect(response).to have_http_status(:redirect)
      expect(session[:user_id]).to eq @user.id
    end

    it 'redirects back to log in if bad user' do
      post :create, params: {
        session: {
          username: @user.username,
          password: nil
        }
      }

      expect(response).to have_http_status(:success)
      expect(session[:user_id]).to eq nil
    end
  end

  describe "GET #destroy" do
    it "returns http success" do
      delete :destroy
      expect(response).to have_http_status(:redirect)
      expect(session[:user_id]).to eq nil
    end
  end

end
