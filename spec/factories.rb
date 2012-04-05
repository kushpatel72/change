FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"
  end
  
  factory :petition do
    title "Give Kush a Job"
    description "Lorem ipsum dolor sit amet, consectetuer 
    adipiscing elit, sed diam nonummy nibh euismod tincidunt 
    ut laoreet dolore magna aliquam erat volutpat."
    user
  end
  
end