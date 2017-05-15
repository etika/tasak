class Router < ApplicationRecord
TOTAL_ROUTERS = 100
LOCATIONS = ["Tilak Nagar", "Rajouri Garden","Tagore Garden","Ramesh Nagar", "Uttam Nagar","Tilak Nagar"]
has_one :strength

def self.to_csv
 lookup = { id: 'Router Id', location: 'Router Location', name: 'Router Name', strength:'Avg Router Strength'}
  CSV.generate(headers: true) do |csv|
    csv << lookup.values
    all.each do |lead|
      csv << lookup.keys.map { |attr| 

        if attr.to_s == 'strength'
          lead.strength.send(attr)
         else
           lead.send(attr)
         end
       }
    end
  end
end

end
