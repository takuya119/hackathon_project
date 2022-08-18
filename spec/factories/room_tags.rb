FactoryBot.define do
  factory :room_tag do
    trait :koto_ku_kaigi_gakusyu do
      room { Room.joins(:public_facility).find_by(name: '第1会議室', public_facilities: { name: '江東区文化センター' }) || create(:room, :koto_ku_kaigi_1) }
      name { '学習' }
    end

    trait :koto_ku_bijutu_bijutu do
      room { Room.joins(:public_facility).find_by(name: '美術室', public_facilities: { name: '江東区文化センター' }) || create(:room, :koto_ku_bijutu_situ) }
      name { '美術' }
    end

    trait :toyosu_kensyu_gakasyu do
      room { Room.joins(:public_facility).find_by(name: '第1研修室', public_facilities: { name: '豊洲文化センター' }) || create(:room, :toyosu_kensyu_1) }
      name { '学習' }
    end

    trait :toyosu_wa_sando do
      room { Room.joins(:public_facility).find_by(name: '和室', public_facilities: { name: '豊洲文化センター' }) || create(:room, :toyosu_wa) }
      name { '三道' }
    end

    trait :sinjuku_ku_kaigi_gakusyu do
      room { Room.joins(:public_facility).find_by(name: '第１会議室', public_facilities: { name: '新宿文化センター' }) || create(:room, :sinjuku_ku_kaigi_1) }
      name { '学習' }
    end

    trait :sinjuku_ku_dai_hall_ongaku do
      room { Room.joins(:public_facility).find_by(name: '大ホール', public_facilities: { name: '新宿文化センター' }) || create(:room, :sinjuku_ku_dai_hall) }
      name { '音楽' }
    end

    trait :sports_kaikan_dai_taikukan_training do
      room { Room.joins(:public_facility).find_by(name: '大体育室', public_facilities: { name: 'スポーツ会館' }) || create(:room, :sports_kaikan_dai_taikukan) }
      name { 'トレーニング' }
    end
  end
end
