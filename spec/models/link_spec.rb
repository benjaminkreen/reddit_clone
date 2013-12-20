require 'spec_helper'

describe Link do
  it "should have a submitter" do
    link1 = FactoryGirl.create(:link)
    link1.submitter.class.should == User
  end

  it "should have a LinkSub" do
    link_sub1 = FactoryGirl.create(:link_sub)
    link_sub1.link.class.should == Link
  end

  it { should have_many(:subs)}

end
