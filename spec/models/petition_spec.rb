require 'spec_helper'

describe Petition do

  let(:user) { FactoryGirl.create(:user) }
  before { @petition = user.petitions.build(:title => "Give Kush a Job",
                                            :description => "He really deserves it") }
                                            
  subject { @petition }
  
  it { should respond_to(:user) }   
  its(:user) { should == user }

  it { should be_valid } 
  
  describe "when user_id is not present" do
    before { @petition.user_id = nil }
    it { should_not be_valid }
  end                                       

end
