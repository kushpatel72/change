require 'spec_helper'

describe User do
  
  before do
    @user = User.new(:email => "hello@gmail.com", :password => "foobar", :name => "Joe")
  end
  
  subject { @user }
  
  # devise validates password & email fields
  
  it { should be_valid }
  
  describe "when name is not present" do
    before { @user.name = " " }
    it { @user.should_not be_valid }
  end
  
  describe "when name is too long" do
    before { @user.name = "a" * 51 }
    it { @user.should_not be_valid }
  end
  
end
