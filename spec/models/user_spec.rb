require 'spec_helper'

describe User do
  it "should not save the password" do
    FactoryGirl.create(:user)
    User.last.password.should be_nil
  end

  describe "::find_by_credentials" do
    it "should find a user with the credentials given" do
      user = FactoryGirl.create(:user)
      User.find_by_credentials(user.email, user.password).should == user
    end
  end

  describe "#reset_token!" do
    it "should reset the user token" do
      user = FactoryGirl.create(:user)
      first_token = User.last.token
      user.reset_token!
      next_token = User.last.token
      first_token.should_not == next_token
    end
  end

  it { should allow_mass_assignment_of(:email) }
  it { should allow_mass_assignment_of(:password) }
  it { should ensure_length_of(:password).is_at_least(6) }

end