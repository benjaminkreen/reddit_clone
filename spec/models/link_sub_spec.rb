require 'spec_helper'

describe LinkSub do
  it "should have an associated link" do
    link_sub1 = FactoryGirl.create(:link_sub)
    link_sub1.link.class.should == Link
  end

  it "should have an associated sub" do
    link_sub2 = FactoryGirl.create(:link_sub)
    link_sub2.sub.class.should == Sub
  end
end
