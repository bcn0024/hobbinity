require 'rails_helper'

describe User do
  describe '#create' do
    it "is valid with a nickname, email, password, password_confirmation" do
      # user = build(:user)
      user = User.new(name: "abe", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
      expect(user).to be_valid
    end
  end
end