require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    before do
      @user = User.new(
        username: 'foobar',
        password: 'password',
        email:    'email@address.com'
      )
    end

    # Username
    it 'requires a username' do
      @user.username = nil
      expect(@user.valid?).to be false
      expect(@user.errors[:username].include? "can't be blank").to be true
    end

    it 'requires username to be between 3 and 20 characters' do
      @user.username = '2c'
      expect(@user.valid?).to be false
      expect(@user.errors[:username].include? "is too short (minimum is 3 characters)").to be true

      @user.username = 'waaaaaaaaaytoooooooloooooonnnnggg'
      expect(@user.valid?).to be false
      expect(@user.errors[:username].include? "is too long (maximum is 20 characters)").to be true
    end

    # Email
    it 'requires an email address' do
      @user.email = nil
      expect(@user.valid?).to be false
      expect(@user.errors[:email].include? "can't be blank").to be true
    end

    # Password
    it 'requires a password' do
      @user.password = nil
      expect(@user.valid?).to be false
      expect(@user.errors[:password].include? "can't be blank").to be true
    end

    it 'requires password to be between 6 and 20 characters' do
      @user.password = 'short'
      expect(@user.valid?).to be false
      expect(@user.errors[:password].include? "is too short (minimum is 6 characters)").to be true

      @user.password = 'waaaaaaaaaytoooooooloooooonnnnggg'
      expect(@user.valid?).to be false
      expect(@user.errors[:password].include? "is too long (maximum is 20 characters)").to be true
    end
  end
end
