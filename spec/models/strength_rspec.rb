require 'spec_helper'
RSpec.describe Strength, :type => :model do
    before(:each) do
      @router = FactoryGirl.create(:router)
    end
  it  "is not valid without strength" do
    strength = FactoryGirl.build(:strength,:strength=>nil,:router_id=>@router.id)
    expect(strength).to_not be_valid
  end

end