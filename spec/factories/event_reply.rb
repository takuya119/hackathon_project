FactoryBot.define do
  factory :event_reply do
    sequence(:name) { |n| "event_reply-name-#{n}" }
    sequence(:content) { |n| "event_reply-content#{n}" }

    trait :event_1_anonymous_reply do
      user { Event.first&.user || create(:user) }
      association(:event_comment, :event_1_comment)
    end

    trait :event_1_reply do
      user { Event.first&.user || create(:user) }
      association(:event_comment, :event_1_general_comment)
    end

    trait :event_2_anonymous_reply do
      user { Event.second&.user || create(:user) }
      association(:event_comment, :event_2_comment)
    end

    trait :event_2_reply do
      user { Event.second&.user || create(:user) }
      association(:event_comment, :event_2_general_comment)
    end
  end
end
