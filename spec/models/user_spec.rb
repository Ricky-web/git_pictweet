require 'rails_helper'
describe User do
  describe '#create' do
    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    it "is invalid without an email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    it "is valid with a nickname, email, password, password_confirmation" do
      user = build(:user)
      expect(user). to be_valid
    end
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    it "is invalid without a password_confirmation" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
    it "is invalid with a nickname that has more than 7 characters" do
      user = build(:user, nickname: "1234567")
      user.valid?
      expect(user.errors[:nickname][0]).to include("is too long (maximum is 6 characters)")
    end
    it "is valid with a nickname that has less than 6 characters" do
      user = build(:user, nickname: "123456")
      user.valid?
      expect(user).to be_valid
    end
    it "is vaild with a password that has more than 6 characters" do
      user = build(:user, password: "123456", password_confirmation: "123456")
      user.valid?
      expect(user).to be_valid
    end
    it "is invalid with a password that has less than 5 characters" do
      user = build(:user, password: "12345", password_confirmation: "12345")
      user.valid?
      expect(user.errors[:password][0]).to include("is too short (minimum is 6 characters)")
    end
  end
end