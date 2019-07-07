require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, type: :helper do
  before do
    session.delete(:user_id)
    @user = create(:user)
  end

  describe 'log_in' do

    it 'updates the session with user data' do
      log_in(@user)

      expect(session[:user_id]).to eq @user.id
    end
  end

  describe 'current_user' do
    it 'returns nil if no user logged in' do
      expect(current_user).to eq nil
    end

    it 'returns the user if logged in' do
      log_in(@user)
      expect(current_user).to eq @user
    end
  end

  describe 'current_user' do
    it 'returns nil if no user logged in' do
      expect(logged_in?).to eq false
    end

    it 'returns the user if logged in' do
      log_in(@user)
      expect(logged_in?).to eq true
    end
  end
end
