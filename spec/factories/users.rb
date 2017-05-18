FactoryGirl.define do

factory :user, class: User do 
    sequence(:name) { |n| "User #{n}" }
    sequence(:email) { |n| "user_#{n}@example.com" }
    password "123456"
    password_confirmation "123456"
    subscribed "1"
  end 
end