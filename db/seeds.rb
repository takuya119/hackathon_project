# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
include FactoryBot::Syntax::Methods

create(:room_tag, :koto_ku_kaigi_gakusyu)
create(:room_tag, :koto_ku_bijutu_bijutu)

create(:room_tag, :toyosu_kensyu_gakasyu)
create(:room_tag, :toyosu_wa_sando)

create(:room_tag, :sinjuku_ku_kaigi_gakusyu)
create(:room_tag, :sinjuku_ku_dai_hall_ongaku)

create(:room_tag, :sports_kaikan_dai_taikukan_training)

create_list(:facility_reply, 3, :koto_ku_kaigi_1_reply)
create_list(:facility_reply, 3, :toyosu_wa_reply)

create(:event_tag, :koto_ku_bunka_center_event_study)
create(:event_tag, :toyosu_bunka_center_event_work)
create(:event_tag, :sports_kaikan_event_tennis)
create(:event_tag, :sinjuku_bunka_center_event_study)

create_list(:event_reply, 3, :koto_ku_bunka_center_event_reply)
create_list(:event_reply, 3, :toyosu_bunka_center_event_reply)

create(:bookmark, :koto_ku_bunka_center_bookmark)
create(:bookmark, :toyosu_bunka_center_bookmark)

create(:participant, :koto_ku_bunka_center_participant)
create(:participant, :toyosu_bunka_center_participant)
