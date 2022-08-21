FactoryBot.define do
  factory :tag do
    trait :study_session do
      name { '学習会' }
    end

    trait :syogi do
      name { '将棋' }
    end

    trait :syodo do
      name { '書道' }
    end

    trait :meeting do
      name { '交流会' }
    end

    trait :soccer do
      name { 'サッカー' }
    end

    trait :tennis do
      name { 'テニス' }
    end

    trait :painting do
      name { '絵画' }
    end

    trait :flower_arrangement do
      name { '華道' }
    end

    trait :music do
      name { '音楽' }
    end
  end
end
