FactoryBot.define do
  factory :participant do
    user { User.find_by(name: 'bookmark-and-partipant-user' ) || create(:user, :bookmark_and_partipant) }

    trait :koto_ku_bunka_center_participant do
      event { Event.joins(:public_facility).find_by(public_facility: { name: '江東区文化センター'}) || create(:event, :koto_ku_bunka_center_event) }
    end

    trait :toyosu_bunka_center_participant do
      event { Event.joins(:public_facility).find_by(public_facility: { name: '豊洲文化センター'}) || create(:event, :toyosu_bunka_center_event) }
    end
  end
end
