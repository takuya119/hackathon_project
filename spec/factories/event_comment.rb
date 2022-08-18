FactoryBot.define do
  factory :event_comment do
    sequence(:name) { |n| "event_comment-name-#{n}" }
    sequence(:content) { |n| "event_comment-content#{n}" }

    trait :koto_ku_bunka_center_event_comment do
      event { Event.joins(:public_facility).find_by(public_facility: { name: '江東区文化センター'}) || create(:event, :koto_ku_bunka_center_event) }
    end

    trait :toyosu_bunka_center_event_comment do
      event { Event.joins(:public_facility).find_by(public_facility: { name: '豊洲文化センター'}) || create(:event, :toyosu_bunka_center_event) }
    end
  end
end
