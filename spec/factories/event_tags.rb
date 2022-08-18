FactoryBot.define do
  factory :event_tag do
    trait :koto_ku_bunka_center_event_study do
      name { '勉強' }
      event { Event.joins(:public_facility).find_by(public_facility: { name: '江東区文化センター'} ) || create(:event, :koto_ku_bunka_center_event) }
    end

    trait :toyosu_bunka_center_event_work do
      name { '仕事' }
      event { Event.joins(:public_facility).find_by(public_facility: { name: '豊洲文化センター'} ) || create(:event, :toyosu_bunka_center_event) }
    end

    trait :sports_kaikan_event_tennis do
      name { 'テニス' }
      event { Event.joins(:public_facility).find_by(public_facility: { name: 'スポーツ会館'} ) || create(:event, :sports_kaikan_event) }
    end

    trait :sinjuku_bunka_center_event_study do
      name { '勉強' }
      event { Event.joins(:public_facility).find_by(public_facility: { name: '新宿文化センター'} ) || create(:event, :sinjuku_bunka_center) }
    end
  end
end
