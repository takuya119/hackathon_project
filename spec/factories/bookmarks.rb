FactoryBot.define do
  factory :bookmark do
    user { User.find_by(name: 'bookmark-and-partipant-user' ) || create(:user, :bookmark_and_partipant) }

    trait :koto_ku_bunka_center_bookmark do
      public_facility { PublicFacility.find_by(name: '江東区文化センター') || create(:public_facility, :koto_ku_bunka_center) }
    end

    trait :toyosu_bunka_center_bookmark do
      public_facility { PublicFacility.find_by(name: '豊洲文化センター') || create(:public_facility, :toyosu_bunka_center) }
    end
  end
end
