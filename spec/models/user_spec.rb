require "rails_helper"

describe User, type: :model do
  it "should not validate a user w/o an email address" do
    @user = FactoryBot.build(:user, email: "no email")
    expect(@user).to_not be_valid
  end
end
