FactoryBot.define do
  factory :event do
    association(:user)
    sequence(:name) { |n| "event-name-#{n}" }
    sequence(:detail) { |n| "event-detail-#{n}" }
    date { DateTime.now }
    capacity { rand(1..40) }

    trait :koto_ku_bunka_center_event do
      public_facility { PublicFacility.find_by(name: '江東区文化センター') || create(:public_facility, :koto_ku_bunka_center) }
    end

    trait :toyosu_bunka_center_event do
      public_facility { PublicFacility.find_by(name: '豊洲文化センター') || create(:public_facility, :toyosu_bunka_center) }
    end

    trait :sports_kaikan_event do
      public_facility { PublicFacility.find_by(name: 'スポーツ会館') || create(:public_facility, :sports_kaikan) }
    end

    trait :sinjuku_bunka_center do
      public_facility { PublicFacility.find_by(name: '新宿文化センター') || create(:public_facility, :sinjuku_bunka_center) }
    end
  end
end
