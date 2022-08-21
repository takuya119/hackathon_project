FactoryBot.define do
  factory :event_comment do
    sequence(:name) { |n| "event_comment-name-#{n}" }
    sequence(:content) { |n| "event_comment-content#{n}" }

    trait :event_1_comment do
      event { Event.first || create(:event)}
    end

    trait :event_1_general_comment do
      user { create(:user) }
      event { Event.first || create(:event)}
    end

    trait :event_2_comment do
      event { Event.second || create(:event)}
    end

    trait :event_2_general_comment do
      user { create(:user) }
      event { Event.second || create(:event)}
    end
  end
end
