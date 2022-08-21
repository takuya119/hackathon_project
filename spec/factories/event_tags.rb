FactoryBot.define do
  factory :event_tag do
    trait :unscheduled_event_study do
      event { Event.find_by(status: 0) || create(:event, status: 0) }
      tag { Tag.find_by(name: '学習会') || create(:tag, :study_session) }
    end

    trait :unscheduled_event_meeting do
      event { Event.find_by(status: 0) || create(:event, status: 0) }
      tag { Tag.find_by(name: '交流会') || create(:tag, :meeting) }
    end

    trait :scheduled_event_study do
      event { Event.find_by(status: 1) || create(:event, status: 1) }
      tag { Tag.find_by(name: '学習会') || create(:tag, :study_session) }
    end

    trait :scheduled_event_meeting do
      event { create(:event, status: 1) }
      tag { Tag.find_by(name: '交流会') || create(:tag, :meeting) }
    end

    trait :scheduled_event_painting do
      event { create(:event, status: 1) }
      tag { Tag.find_by(name: '絵画') || create(:tag, :painting) }
    end

    trait :cancel_event_study do
      event { create(:event, status: 2) }
      tag { Tag.find_by(name: '学習会') || create(:tag, :study_session) }
    end
  end
end
