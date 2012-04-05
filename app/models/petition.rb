class Petition < ActiveRecord::Base
  attr_accessible :description, :title
  
  belongs_to :user
  
  validates_presence_of :user_id
end
