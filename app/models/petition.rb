class Petition < ActiveRecord::Base
  attr_accessible :description, :title
  
  belongs_to :user
  
  validates_presence_of :user_id
  
  validates_presence_of :title
  validates_length_of :title, :maximum => 50
  
  validates_presence_of :description
  validates_length_of :description, :minimum => 140
  validates_length_of :description, :maximum => 5000
end
