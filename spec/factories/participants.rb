FactoryBot.define do
  factory :participant do
    user { User.find_by(name: 'bookmark-and-partipant-user' ) || create(:user, :bookmark_and_partipant) }

    trait :unscheduled_event_participant do
      event { Event.find_by(status: 0) || create(:event, status: 0) }
    end

    trait :scheduled_event_participant do
      event { Event.find_by(status: 1) || create(:event, status: 1) }
    end

    trait :cancel_event_participant do
      event { Event.find_by(status: 2) || create(:event, status: 2) }
    end
  end
end
