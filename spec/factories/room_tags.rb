FactoryBot.define do
  factory :room_tag do
    trait :koto_ku_kaigi_study_session do
      room { Room.joins(:public_facility).find_by(name: '第1会議室', public_facilities: { name: '江東区文化センター' }) || create(:room, :koto_ku_kaigi_1) }
      tag { Tag.find_by(name: '学習会') || create(:tag, :study_session) }
    end

    trait :koto_ku_kaigi_meeting do
      room { Room.joins(:public_facility).find_by(name: '第1会議室', public_facilities: { name: '江東区文化センター' }) || create(:room, :koto_ku_kaigi_1) }
      tag { Tag.find_by(name: '交流会') || create(:tag, :meeting) }
    end

    trait :koto_ku_bijutu_painting do
      room { Room.joins(:public_facility).find_by(name: '美術室', public_facilities: { name: '江東区文化センター' }) || create(:room, :koto_ku_bijutu_situ) }
      tag { Tag.find_by(name: '絵画') || create(:tag, :painting) }
    end

    trait :koto_ku_bijutu_flower_arrangement do
      room { Room.joins(:public_facility).find_by(name: '美術室', public_facilities: { name: '江東区文化センター' }) || create(:room, :koto_ku_bijutu_situ) }
      tag { Tag.find_by(name: '華道') || create(:tag, :flower_arrangement) }
    end

    trait :toyosu_kensyu_study_session do
      room { Room.joins(:public_facility).find_by(name: '第1研修室', public_facilities: { name: '豊洲文化センター' }) || create(:room, :toyosu_kensyu_1) }
      tag { Tag.find_by(name: '学習会') || create(:tag, :study_session) }
    end

    trait :toyosu_kensyu_meeting do
      room { Room.joins(:public_facility).find_by(name: '第1研修室', public_facilities: { name: '豊洲文化センター' }) || create(:room, :toyosu_kensyu_1) }
      tag { Tag.find_by(name: '交流会') || create(:tag, :meeting) }
    end

    trait :toyosu_wa_syodo do
      room { Room.joins(:public_facility).find_by(name: '和室', public_facilities: { name: '豊洲文化センター' }) || create(:room, :toyosu_wa) }
      tag { Tag.find_by(name: '書道') || create(:tag, :syodo) }
    end

    trait :toyosu_wa_flower_arrangement do
      room { Room.joins(:public_facility).find_by(name: '和室', public_facilities: { name: '豊洲文化センター' }) || create(:room, :toyosu_wa) }
      tag { Tag.find_by(name: '華道') || create(:tag, :flower_arrangement) }
    end

    trait :sinjuku_ku_kaigi_study_session do
      room { Room.joins(:public_facility).find_by(name: '第１会議室', public_facilities: { name: '新宿文化センター' }) || create(:room, :sinjuku_ku_kaigi_1) }
      tag { Tag.find_by(name: '学習会') || create(:tag, :study_session) }
    end

    trait :sinjuku_ku_kaigi_meeting do
      room { Room.joins(:public_facility).find_by(name: '第１会議室', public_facilities: { name: '新宿文化センター' }) || create(:room, :sinjuku_ku_kaigi_1) }
      tag { Tag.find_by(name: '交流会') || create(:tag, :meeting) }
    end

    trait :sinjuku_ku_dai_hall_music do
      room { Room.joins(:public_facility).find_by(name: '大ホール', public_facilities: { name: '新宿文化センター' }) || create(:room, :sinjuku_ku_dai_hall) }
      tag { Tag.find_by(name: '音楽') || create(:tag, :music) }
    end

    trait :sports_kaikan_dai_taikukan_soccer do
      room { Room.joins(:public_facility).find_by(name: '大体育室', public_facilities: { name: 'スポーツ会館' }) || create(:room, :sports_kaikan_dai_taikukan) }
      tag { Tag.find_by(name: 'サッカー') || create(:tag, :soccer) }
    end

    trait :sports_kaikan_dai_taikukan_tennis do
      room { Room.joins(:public_facility).find_by(name: '大体育室', public_facilities: { name: 'スポーツ会館' }) || create(:room, :sports_kaikan_dai_taikukan) }
      tag { Tag.find_by(name: 'テニス') || create(:tag, :tennis) }
    end
  end
end
