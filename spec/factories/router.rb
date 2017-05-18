FactoryGirl.define do

factory :router, class: Router do 
    sequence(:name) { Array.new(32){rand(36).to_s(36)}.join   }
    sequence(:location) {  Router::LOCATIONS.sample}
    before :create do |r|
      r.strengths << FactoryGirl.create(:strength)
      r.strengths << FactoryGirl.create(:strength)
    end
  end 
end