FactoryBot.define do
  factory :facility_reply do
    sequence(:name) { |n| "facility_reply-name-#{n}" }
    sequence(:content) { |n| "facility_reply-content#{n}" }

    trait :koto_ku_kaigi_1_reply do
      association(:facility_comment, :koto_ku_kaigi_1_comment)
    end

    trait :koto_ku_kaigi_1_admin_reply do
      user { User.find_by(role: 1) || create(:user, :admin) }
      association(:facility_comment, :koto_ku_kaigi_1_comment)
    end

    trait :toyosu_wa_reply do
      association(:facility_comment, :toyosu_wa_comment)
    end

    trait :toyosu_wa_admin_reply do
      user { User.find_by(role: 1) || create(:user, :admin) }
      association(:facility_comment, :toyosu_wa_comment)
    end
  end
end
