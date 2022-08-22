FactoryBot.define do
  factory :event do
    association(:user)
    sequence(:name) { |n| "event-name-#{n}" }
    sequence(:detail) { |n| "event-detail-#{n}" }
    start_time { DateTime.new(2022, 10, 1, rand(9..12)) }
    end_time { DateTime.new(2022, 10, 1, rand(13..17)) }
    capacity { rand(1..40) }
  end
end
