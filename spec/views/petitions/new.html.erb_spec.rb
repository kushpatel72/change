require 'spec_helper'

describe 'petitions/new' do
  
  context "form" do
    
    before do
      assign(:petition, Petition.new)
    end
    
    it "has a form posting to /petitions" do
      rendered.should have_selector('form', :with => 
            {:action => "/links", :method => 'post'}) do
        with_tag "input", :with => { :name => "petition[title]"}
        with_tag "input", :with => { :name => "petition[description]"}        
      end  
    end
    
  end
end