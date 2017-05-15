namespace :fakedata do
  desc "TODO"
  task routers_strength: :environment do
    # (1..Router::TOTAL_ROUTERS).each do |r|
    # router=Router.create(:name=> Array.new(32){rand(36).to_s(36)}.join + r.to_s,:location=> Router::LOCATIONS.sample)
    # random_number = Random.rand(2..5)
    # (1..random_number).each do |n|
    #   Strength.create(:router_id=> router.id, :strength=>20 + Random.rand(11)  )
    # end
    # end
   Router.bulk_insert(:name, :location,:created_at, :updated_at) do |worker|
    (1..Router::TOTAL_ROUTERS).each do |r|
        worker.add name:  Array.new(32){rand(36).to_s(36)}.join  , location: Router::LOCATIONS.sample
     end
    end

   Strength.bulk_insert(:router_id,:strength,:updated_at,:created_at) do |worker|
    Router.all.each do |r|
      random_number = Random.rand(2..5)
      (1..random_number).each do |n|
        worker.add router_id: r.id, strength: 20 + Random.rand(11)
       end
      end
    end
   
   end

  end

