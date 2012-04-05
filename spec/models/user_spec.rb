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
  
  
  describe "petition associations" do  
    
    before { @user.save }
    let!(:petition) do 
      FactoryGirl.create(:petition, user: @user)
    end
    
    it "should destroy associated petitions" do
      petitions = @user.petitions
      @user.destroy
      petitions.each do |petition|
        Petition.find_by_id(petition.id).should be_nil
      end
      
    end
  
  end
  
end
