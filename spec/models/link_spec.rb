require 'spec_helper'

describe Link do
  
  before(:each) do
    @user = Factory(:user)
    @attr = { :description => "value for content",
              :url => "value for content"}
  end
  
  it "should create a new instance given valid attributes" do
    @user.links.create!(@attr)
  end
  
  describe "user associations" do
    
    before(:each) do
      @link = @user.links.create!(@attr)
    end
    
    it "should have a user attribute" do
      @link.should respond_to(:user)
    end
    
    it "should have the right associate user" do
      @link.user_id.should == @user.id
      @link.user.should == @user
    end
  end
  
  describe "validations" do

    it "should require a user id" do
      Link.new(@attr).should_not be_valid
    end

    it "should require nonblank content" do
      @user.links.build(:description => "  ").should_not be_valid
      @user.links.build(:url => "  ").should_not be_valid
    end

    it "should reject long content" do
      @user.links.build(:description => "a" * 100).should_not be_valid
    end
  end
end
