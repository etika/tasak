require "rails_helper"

RSpec.describe ReportsController, :type => :routing do
  describe "routing" do
    it "routes to home" do
      expect(:get => "/").to route_to("reports#home")
    end
     it "routes to #index" do
      expect(:get => "/reports").to route_to("reports#index")
    end
     it "routes to #csv_reports" do
      expect(:get => "/csv_reports").to route_to("reports#csv_reports")
    end
end 
end