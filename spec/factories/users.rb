FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "general-#{n}" }
    sequence(:email) { |n| "general-#{n}@example.com" }
    password { 'password' }
    crypted_password { 'password' }

    trait :admin do
      sequence(:name) { |n| "admin-#{n}" }
      sequence(:email) { |n| "admin-#{n}@example.com" }
      role { 1 }
    end

    trait :bookmark_and_partipant do
      name { 'bookmark-and-partipant-user' }
      email { 'bookmark-and-partipant@example.com' }
    end
  end
end
