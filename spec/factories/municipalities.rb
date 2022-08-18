FactoryBot.define do
  factory :municipality do
    trait :koto_ku do
      name { '江東区' }
    end

    trait :sinjuku_ku do
      name { '新宿区' }
    end
  end
end
