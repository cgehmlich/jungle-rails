require 'rails_helper'

RSpec.describe User, type: :model do
  @user = User.new(
    name: 'tester',
    email: 'tester@email.com',
    password: 'tester',
    password_confirmation: 'tester'
  )
  describe 'Validations' do
    it "is not valid without a name" do
      @user.name = nil
      expect(@user).to_not be_valid
    end
    it "is not valid without an email" do
      @user.email = nil
      expect(@user).to_not be_valid
    end
    it "is not valid without a password" do
      @user.password = nil
      expect(@user).to_not be_valid
    end
    it "is not valid without a password confirmation" do
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end
    it "is not valid if password does not match password confirmation" do
      @user.password_confirmation = 'nottester'
      expect(@user).to_not be_valid
    end
  end
  describe '.authenticate_with_credentials' do
    it 'should log in a user who enters valid credentials' do
      user.save
      expect(User.authenticate_with_credentials('tester@email.com', 'tester')).to be_truthy
    end
    it 'should reject login for an incorrect password' do
      user.save
      expect(User.authenticate_with_credentials('tester@email.com', 'nottester')).to be_falsey
    end
    it 'should login for case insensitive emails' do
      user.save
      expect(User.authenticate_with_credentials('tester@email.com', 'tester')).to be_truthy
    end
    it 'should reject login for emails with leading spaces' do
      user.save
      expect(User.authenticate_with_credentials('   tester@email.com', 'tester')).to be_falsey
    end
end
end
