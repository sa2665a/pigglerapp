require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it "has a valid factory" do
    expect(user).to be_valid
  end

  it "is invalid without an email" do
    user.email = nil
    expect(user).not_to be_valid
  end

  it "is invalid without a password" do
    user.password = nil
    expect(user).not_to be_valid
  end

   it "is valid without being an admin" do
    user.admin = nil
    expect(user).to be_valid
  end

end