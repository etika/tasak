require 'rails_helper'
# require 'spec_helper'

RSpec.describe Router, :type => :model do
  it "is not valid without name" do
    router = FactoryGirl.build(:router,:name=>nil)
    expect(router).to_not be_valid
  end
  it "is not valid without location" do
      router = FactoryGirl.build(:router,:location=>nil,:name=>"abx")
     expect(router).to_not be_valid
  end
  it "should have strength" do
    router = FactoryGirl.create(:router,:location=>"Uttam Nagar",:name=>"abx")
    expect(router.strengths.count).to be >  0
  end
  it  "should have average strength" do
    router = FactoryGirl.create(:router,:location=>"Uttam Nagar",:name=>"abx")
    expect(router.average_strength).to be > 0
  end
end