require 'spec_helper'

describe Petition do

  let(:user) { FactoryGirl.create(:user) }
  before { @petition = user.petitions.build(:title => "Give Kush a Job",
                                            :description => "Lorem ipsum dolor sit amet,
                                             consectetuer adipiscing elit, sed diam nonummy 
                                             nibh euismod tincidunt ut laoreet dolore magna 
                                             aliquam erat volutpat.") }
                                            
  subject { @petition }
  
  it { should respond_to(:user) }   
  its(:user) { should == user }

  it { should be_valid } 
  
  describe "when user_id is not present" do
    before { @petition.user_id = nil }
    it { should_not be_valid }
  end      
  
  describe "when title is too long" do
    before { @petition.title = "a" * 51 }
    it { @petition.should_not be_valid }
  end             
  
  describe "when title is not present" do
    before { @petition.title = " " }
    it { @petition.should_not be_valid }
  end             
  
  describe "when description is too short" do
    before { @petition.description = "a" * 139 }
    it { @petition.should_not be_valid }
  end             

  describe "when description is too long" do
    before { @petition.description = "a" * 5001 }
    it { @petition.should_not be_valid }
  end
  
  describe "when description is not present" do
    before { @petition.description = " " }
    it { @petition.should_not be_valid }
  end
  
end
