FactoryBot.define do
  factory :public_facility do
    association(:user, :admin)

    trait :koto_ku_bunka_center do
      municipality { Municipality.find_by(name: '江東区') || create(:municipality, :koto_ku) }
      name { '江東区文化センター' }
      address { '江東区東陽4-11-3' }
      latitude { '35.673086' }
      longitude { '139.818678' }
      category { '文化センター' }
      reserve_url { 'https://www.kcf.or.jp/koto/' }
    end

    trait :toyosu_bunka_center do
      municipality { Municipality.find_by(name: '江東区') || create(:municipality, :koto_ku) }
      name { '豊洲文化センター' }
      address { '江東区豊洲2-2-18' }
      latitude { '35.654581' }
      longitude { '139.795247' }
      category { '文化センター' }
      reserve_url { 'https://www.kcf.or.jp/toyosu/' }
    end

    trait :sports_kaikan do
      municipality { Municipality.find_by(name: '江東区') || create(:municipality, :koto_ku) }
      name { 'スポーツ会館' }
      address { '江東区北砂1-2-9' }
      latitude { '35.684788' }
      longitude { '139.821396' }
      category { 'スポーツ施設' }
      reserve_url { 'https://www.koto-hsc.or.jp/sports_center1/' }
    end

    trait :sinjuku_bunka_center do
      municipality { Municipality.find_by(name: '新宿区') || create(:municipality, :sinjuku_ku) }
      name { '新宿文化センター' }
      address { '新宿区新宿6-14-1' }
      latitude { '35.69578206247419' }
      longitude { '139.70960226867558' }
      category { '文化センター' }
      reserve_url { 'https://www.regasu-shinjuku.or.jp/bunka-center/' }
    end
  end
end
