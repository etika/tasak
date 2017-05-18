require 'spec_helper'

RSpec.describe ChaosesController, :type => :controller do
  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
    @list=FactoryGirl.create(:requested_trip, :op_id => @admin.id)
  end

end