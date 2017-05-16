class Router < ApplicationRecord
TOTAL_ROUTERS = 9000
LOCATIONS = ["Tilak Nagar", "Rajouri Garden","Tagore Garden","Ramesh Nagar", "Uttam Nagar","Tilak Nagar"]
has_many :strengths
attr_accessor :average_strength
def self.to_csv
 lookup = { id: 'Router Id', location: 'Router Location', name: 'Router Name', average_strength:'Avg Router Strength'}
  CSV.generate(headers: true) do |csv|
    csv << lookup.values
    Router.uncached do 
    all.find_each(batch_size:500) do |lead|
      csv << lookup.keys.map { |attr| 
          lead.send(attr)
       }
    end
  end
end
end

def average_strength
  self.strengths.average(:strength)
end
end
