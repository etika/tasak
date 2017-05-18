FactoryGirl.define do

factory :strength, class: Strength do 
    sequence(:strength) { 20 + Random.rand(11)}
end
end 