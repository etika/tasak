FactoryGirl.define do

factory :user, class: User do 
    sequence(:email) { |n| "user_#{n}@example.com" }
    password "123456"
    password_confirmation "123456"
  end 
end