require 'spec_helper'
require 'rails_helper'

RSpec.describe ReportsController, :type => :controller do
  before(:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

 describe "GET index" do

    it "response 200 successfully displays index page" do
      router = FactoryGirl.create(:router)
      expect(response.status).to eq(200)
    end  

    it "is render template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET home" do
     it "response 200 successfully displays page" do
      expect(response.status).to eq(200)
     end
     it "is render template" do
       get :home
       expect(response).to render_template("home")
     end
  end

  describe "GET/index generate CSV" do

  it "generate CSV" do
    get :csv_reports, format: :csv
    expect(response.header['Content-Type']).to include 'text/csv'
    expect(response.body).to include('what you expect the file to have')
  end
end

end