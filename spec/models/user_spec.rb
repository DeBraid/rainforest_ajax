require "spec_helper"

describe User do 

  let(:user) { FactoryGirl.build(:user)}

  describe "validations" do
    it "should have a valid factory" do 
      user.should be_valid
    end

    it "should validate presence of password on create" do
      user.password = nil
      user.should_not be_valid
    end

    it "should not validate password on update" do
      user.save
      user.password = nil
      user.should be_valid
    end

    it "should validate presence of email" do
      user.email = nil
      user.should_not be_valid
    end

    it "should validate uniqueness of email" do
      user.save
      second_user = FactoryGirl.build(:user, :email => user.email)
      second_user.should_not be_valid
    end

    it "should validate username is longer than 3 characters" do
      user.username = "me"
      user.should_not be_valid
    end

    it "should validate presence of username" do
      user.username = nil
      user.should_not be_valid
    end

    it "should validate uniqueness of username" do
      user.save
      second_user = FactoryGirl.build(:user, :username => user.username)
      second_user.should_not be_valid
    end
  end

  describe "#username_string" do
    it "should return the username if it exists" do
      user.save
      user.username_string.should == user.username
    end

    it "should return the email address if a username doesn't exist" do
      user.save
      user.update_column(:username, nil)
      user.username_string.should == user.email
    end
  end

end