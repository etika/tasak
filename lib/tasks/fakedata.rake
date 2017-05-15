namespace :fakedata do
  desc "TODO"
  task routers_strength: :environment do
    (1..Router::TOTAL_ROUTERS).each do |r|
    router=Router.create(:name=> Array.new(32){rand(36).to_s(36)}.join + r.to_s,:location=> Router::LOCATIONS.sample)
    Strength.create(:router_id=> router.id, :strength=>20 + Random.rand(11)  )
    end
  end

end
