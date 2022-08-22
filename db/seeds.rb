# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
include FactoryBot::Syntax::Methods

create(:room_tag, :koto_ku_kaigi_study_session)
create(:room_tag, :koto_ku_kaigi_meeting)
create(:room_tag, :koto_ku_bijutu_painting)
create(:room_tag, :koto_ku_bijutu_flower_arrangement)
create(:room_tag, :toyosu_kensyu_study_session)
create(:room_tag, :toyosu_kensyu_meeting)
create(:room_tag, :toyosu_wa_syodo)
create(:room_tag, :toyosu_wa_flower_arrangement)
create(:room_tag, :sinjuku_ku_kaigi_study_session)
create(:room_tag, :sinjuku_ku_kaigi_meeting)
create(:room_tag, :sinjuku_ku_dai_hall_music)
create(:room_tag, :sports_kaikan_dai_taikukan_soccer)
create(:room_tag, :sports_kaikan_dai_taikukan_tennis)

create(:facility_reply, :koto_ku_kaigi_1_reply)
create(:facility_reply, :koto_ku_kaigi_1_admin_reply)
create(:facility_reply, :toyosu_wa_reply)
create(:facility_reply, :toyosu_wa_admin_reply)

create(:event_tag, :unscheduled_event_study)
create(:event_tag, :unscheduled_event_meeting)
create(:event_tag, :scheduled_event_study)
create(:event_tag, :scheduled_event_meeting)
create(:event_tag, :scheduled_event_painting)
create(:event_tag, :cancel_event_study)

create(:event_reply, :event_1_reply)
create(:event_reply, :event_1_anonymous_reply)
create(:event_reply, :event_2_reply)
create(:event_reply, :event_2_anonymous_reply)

create(:bookmark, :koto_ku_bunka_center_bookmark)
create(:bookmark, :toyosu_bunka_center_bookmark)

create(:participant, :unscheduled_event_participant)
create(:participant, :scheduled_event_participant)
create(:participant, :cancel_event_participant)
