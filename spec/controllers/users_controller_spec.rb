require 'spec_helper'

describe UsersController do
  render_views
  
  describe "get 'show'" do
    
    before(:each) do
      @user = Factory(:user)
    end
    
    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end
    
    it "should find the right user" do
      get :show , :id => @user
      assigns(:user).should == @user
    end
    
    it "should have the right title" do
      get :show, :id => @user
      response.should have_selector("title", :content => @user.username)
    end
    
    it "should include the user's name" do
      get :show, :id => @user
      response.should have_selector("h1", :content => @user.username)
    end
    
    it "should have a profile image" do
      get :show, :id => @user
      response.should have_selector("h1>img", :class => "gravatar")
    end
  end
  
  describe "GET 'index'" do
    
    describe "for non-signed-in users" do
      it "should deny access" do
        get :index
        response.should redirect_to(new_user_session_path)
      end
    end
    
    describe "for signed-in users" do
      
      before (:each) do
        @user = test_sign_in(Factory(:user))
        second = Factory(:user, :username => "Bob", :email => "another@example.com" )
        third = Factory(:user, :username => "Ben", :email => "another@example.net")
      
        @users = [@user, second, third]
      end
      
      it "should be successful" do
        get :index
        response.should be_success
      end
      
      it "should have the right title" do
        get :index
        response.should have_selector("title", :content => "All users")
      end
      
      it "should have an element for each user" do
        get :index
        @users.each do |user|
          response.should have_selector("li", :content => user.username)
        end
      end
    end  
  end      
end
