require 'spec_helper'

describe Sub do
  it "should have a moderator" do
    sub1 = FactoryGirl.create(:sub)
    sub1.moderator.class.should == User
  end

  it { should have_many(:links) }

end
