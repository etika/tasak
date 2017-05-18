class Router < ApplicationRecord
TOTAL_ROUTERS = 9000
LOCATIONS = ["Tilak Nagar", "Rajouri Garden","Tagore Garden","Ramesh Nagar", "Uttam Nagar","Tilak Nagar"]
has_many :strengths
validates_presence_of :location, :name 

# attr_accessor :average_strength

def self.to_csv
  lookup = { id: 'Router Id', location: 'Router Location', name: 'Router Name', average_strength:'Avg Router Strength'}
  CSV.generate(headers: true) do |csv|
    csv << lookup.values
    all.find_each(batch_size:500) do |router|
      csv << lookup.keys.map { |attr| 
        router.send(attr)
       }
    end
  end
end

def average_strength
  self.strengths.average(:strength).round(2)
end
end
