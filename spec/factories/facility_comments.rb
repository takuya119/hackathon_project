FactoryBot.define do
  factory :facility_comment do
    sequence(:name) { |n| "facility_comment-name-#{n}" }
    sequence(:content) { |n| "facility_comment-content#{n}" }

    trait :koto_ku_kaigi_1_comment do
      public_facility { PublicFacility.find_by(name: '江東区文化センター') || create(:public_facility, :koto_ku_bunka_center) }
      room { Room.joins(:public_facility).find_by(name: '第1会議室', public_facility: { name: '江東区文化センター'}) || create(:room, :koto_ku_kaigi_1) }
    end

    trait :toyosu_wa_comment do
      public_facility { PublicFacility.find_by(name: '豊洲文化センター') || create(:public_facility, :toyosu_bunka_center) }
      room { Room.joins(:public_facility).find_by(name: '和室', public_facility: { name: '豊洲文化センター'}) || create(:room, :toyosu_wa) }
    end
  end
end
