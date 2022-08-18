FactoryBot.define do
  factory :event_reply do
    sequence(:name) { |n| "event_reply-name-#{n}" }
    sequence(:content) { |n| "event_reply-content#{n}" }

    trait :koto_ku_bunka_center_event_reply do
      association(:event_comment, :koto_ku_bunka_center_event_comment)
    end

    trait :toyosu_bunka_center_event_reply do
      association(:event_comment, :toyosu_bunka_center_event_comment)
    end
  end
end
