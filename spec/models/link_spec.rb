require 'spec_helper'

describe Link do
  it "should have a submitter" do
    link1 = FactoryGirl.build(:link)
    link1.submitter.class.should == User
  end

  it "should have a LinkSub" do
    link_sub1 = FactoryGirl.build(:link_sub)
    link_sub1.link.class.should == Link
  end

  it "should be invalid without subs" do
    link = FactoryGirl.build(:link)
    link.should_not be_valid
  end

  it "should have at least one Sub" do
    link = Link.new(:title => "name", :url => "google.com", :user_id => 3)
    sub = Sub.new(:name => "sub_name", :user_id => 3)
    link.subs = [sub]
    #link.save
    # p link.valid?
    # p link.errors.full_messages
    #
    # p link.subs.count

    link.should be_valid
  end

end
