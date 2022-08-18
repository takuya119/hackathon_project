FactoryBot.define do
  factory :room do
    trait :koto_ku_kaigi_1 do
      public_facility { PublicFacility.find_by(name: '江東区文化センター') || create(:public_facility, :koto_ku_bunka_center) }
      name { '第1会議室' }
      fee { 3000 }
      capacity { 20 }
    end

    trait :koto_ku_bijutu_situ do
      public_facility { PublicFacility.find_by(name: '江東区文化センター') || create(:public_facility, :koto_ku_bunka_center) }
      name { '美術室' }
      fee { 5000 }
      capacity { 30 }
    end

    trait :toyosu_kensyu_1 do
      public_facility { PublicFacility.find_by(name: '豊洲文化センター') || create(:public_facility, :toyosu_bunka_center) }
      name { '第1研修室' }
      fee { 2500 }
      capacity { 36 }
    end

    trait :toyosu_wa do
      public_facility { PublicFacility.find_by(name: '豊洲文化センター') || create(:public_facility, :toyosu_bunka_center) }
      name { '和室' }
      fee { 1000 }
      capacity { 24 }
    end

    trait :sinjuku_ku_kaigi_1 do
      public_facility { PublicFacility.find_by(name: '新宿文化センター') || create(:public_facility, :sinjuku_bunka_center) }
      name { '第１会議室' }
      fee { 8000 }
      capacity { 60 }
    end

    trait :sinjuku_ku_dai_hall do
      public_facility { PublicFacility.find_by(name: '新宿文化センター') || create(:public_facility, :sinjuku_bunka_center) }
      name { '大ホール' }
      fee { 100000 }
      capacity { 100 }
    end

    trait :sports_kaikan_dai_taikukan do
      public_facility { PublicFacility.find_by(name: 'スポーツ会館') || create(:public_facility, :sports_kaikan) }
      name { '大体育室' }
      fee { 400 }
      capacity { 1 }
    end
  end
end
