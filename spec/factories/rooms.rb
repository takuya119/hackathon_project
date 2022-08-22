FactoryBot.define do
  factory :room do
    sequence(:description) { |n| "room-description-#{n}" }
    trait :koto_ku_kaigi_1 do
      public_facility { PublicFacility.find_by(name: '江東区文化センター') || create(:public_facility, :koto_ku_bunka_center) }
      name { '第1会議室' }
      capacity { 20 }
    end

    trait :koto_ku_bijutu_situ do
      public_facility { PublicFacility.find_by(name: '江東区文化センター') || create(:public_facility, :koto_ku_bunka_center) }
      name { '美術室' }
      capacity { 30 }
    end

    trait :toyosu_kensyu_1 do
      public_facility { PublicFacility.find_by(name: '豊洲文化センター') || create(:public_facility, :toyosu_bunka_center) }
      name { '第1研修室' }
      capacity { 36 }
    end

    trait :toyosu_wa do
      public_facility { PublicFacility.find_by(name: '豊洲文化センター') || create(:public_facility, :toyosu_bunka_center) }
      name { '和室' }
      capacity { 24 }
    end

    trait :sinjuku_ku_kaigi_1 do
      public_facility { PublicFacility.find_by(name: '新宿文化センター') || create(:public_facility, :sinjuku_bunka_center) }
      name { '第１会議室' }
      capacity { 60 }
    end

    trait :sinjuku_ku_dai_hall do
      public_facility { PublicFacility.find_by(name: '新宿文化センター') || create(:public_facility, :sinjuku_bunka_center) }
      name { '大ホール' }
      capacity { 100 }
    end

    trait :sports_kaikan_dai_taikukan do
      public_facility { PublicFacility.find_by(name: 'スポーツ会館') || create(:public_facility, :sports_kaikan) }
      name { '大体育室' }
      capacity { 1 }
    end
  end
end
