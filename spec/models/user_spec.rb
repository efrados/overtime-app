require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.create(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "John",last_name: "Snow")
  end

  describe "creation" do

    it "can be created" do
      expect(@user).to be_valid
    end

    it "cannot be created without first_name and last_name" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end

  describe "custom method" do
    it "has a full name method that combines first_name and last_name" do
      expect(@user.full_name).to eq("SNOW, JOHN")
    end
  end
end
