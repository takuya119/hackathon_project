# README

# サービス概要

- 公共施設の稼働率が低くあまり知られてない
- 自治体・施設ごとに HP が別れており、使用用途や予約方法を調べにくい

上記 2 つの問題を解消し、都民と公共施設のインターフェースの役割を担うサービス.

[稼働率を参考にしたページ](https://www.soumu.metro.tokyo.lg.jp/05gyousei/04kusichousonkoukyoushisetsu.html)

[新宿区公共施設等総合管理計画](https://www.city.shinjuku.lg.jp/content/000211415.pdf)

上記 URL にある PDF の p45~6 から抜粋した新宿区民の意見

- せっかくある区有施設が、区民に知られていないことが多いと思います。周知方法を（できるだけ低価格の方法にする等）検討したうえで、効果的に区民に知らせることをお願いしたいです。
- 区有施設の活動内容や取組み、施設の利便性などがあまり広く認識されていない。地域へのあり方を広くアピールすべき。
- もっと利用者を増やすべきＰＲ活動をもっと積極的にしてほしい。少人数の参加者で実にもったいない（お知らせの範囲が少ない。工夫して一考を要すると思います）。

# ER 図

[ER 図](https://drive.google.com/file/d/1YVxBCCddo7B4j3Qr0x5NQvrZVw-Jv0jC/view?usp=sharing)

### User テーブル

User を管理するテーブル<br>
Sorcery にて作成

```
t.string "name", null: false
t.string "email", null: false
t.integer "role", default: 0, null: false
t.string "crypted_password"
t.string "salt"
t.datetime "created_at", null: false
t.datetime "updated_at", null: false
t.string "reset_password_token"
t.datetime "reset_password_token_expires_at"
t.datetime "reset_password_email_sent_at"
t.integer "access_count_to_reset_password_page", default: 0
t.index ["email"], name: "index_users_on_email", unique: true
t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
```

### Public Facility テーブル

公共施設を管理するテーブル

```
t.string "name", null: false
t.string "address", null: false
t.string "longitude", null: false
t.string "latitude", null: false
t.string "category", null: false
t.string "reserve_url"
t.integer "municipality_id", null: false
t.integer "user_id", null: false
t.datetime "created_at", null: false
t.datetime "updated_at", null: false
t.index ["municipality_id"], name: "index_public_facilities_on_municipality_id"
t.index ["user_id"], name: "index_public_facilities_on_user_id"
```

### Municipality テーブル

東京 23 区を登録するテーブル（マスターテーブル）

```
t.string "name", null: false
```

### Bookmark テーブル

ユーザーが公共施設をお気に入り登録するために作った中間テーブル

```
t.integer "user_id", null: false
t.integer "public_facility_id", null: false
t.datetime "created_at", null: false
t.datetime "updated_at", null: false
t.index ["public_facility_id"], name: "index_bookmarks_on_public_facility_id"
t.index ["user_id"], name: "index_bookmarks_on_user_id"
```

### Room テーブル

施設ごとの部屋（会議室など）を登録するテーブル

```
t.string "name", null: false
t.integer "fee", null: false
t.integer "capacity"
t.integer "public_facility_id", null: false
t.datetime "created_at", null: false
t.datetime "updated_at", null: false
t.index ["public_facility_id"], name: "index_rooms_on_public_facility_id"
```

### Room Tag テーブル

上記 Room テーブルの使用用途をタグとして登録するテーブル

```
t.string "name", null: false
t.integer "room_id", null: false
t.datetime "created_at", null: false
t.datetime "updated_at", null: false
t.index ["room_id"], name: "index_room_tags_on_room_id"
```

### Facility Comment テーブル

公共施設に関するコメントを登録するテーブル

```
t.string "name", null: false
t.text "content", null: false
t.integer "comment_type", default: 0, null: false
t.integer "public_facility_id", null: false
t.integer "room_id"
t.datetime "created_at", null: false
t.datetime "updated_at", null: false
t.index ["public_facility_id"], name: "index_facility_comments_on_public_facility_id"
t.index ["room_id"], name: "index_facility_comments_on_room_id"
```

### Facility Reply テーブル

上記のコメントに関する回答やスレッドを表現するためのテーブル

```
t.string "name", null: false
t.text "content", null: false
t.integer "facility_comment_id", null: false
t.datetime "created_at", null: false
t.datetime "updated_at", null: false
t.index ["facility_comment_id"], name: "index_facility_replies_on_facility_comment_id"
```

### Event テーブル

開催されるイベントを登録するテーブル

```
t.string "name", null: false
t.datetime "date", null: false
t.text "detail"
t.integer "capacity"
t.integer "user_id", null: false
t.integer "public_facility_id", null: false
t.datetime "created_at", null: false
t.datetime "updated_at", null: false
t.index ["public_facility_id"], name: "index_events_on_public_facility_id"
t.index ["user_id"], name: "index_events_on_user_id"
```

### Participant テーブル

参加者を確認するためにユーザーとイベントをつなげる中間テーブル

```
t.integer "user_id", null: false
t.integer "event_id", null: false
t.datetime "created_at", null: false
t.datetime "updated_at", null: false
t.index ["event_id"], name: "index_participants_on_event_id"
t.index ["user_id"], name: "index_participants_on_user_id"
```

### Event Comment テーブル

イベントに関するコメントを登録するテーブル

```
t.string "name"
t.text "content"
t.integer "event_id", null: false
t.datetime "created_at", null: false
t.datetime "updated_at", null: false
t.index ["event_id"], name: "index_event_comments_on_event_id"
```

### Event Reply テーブル

上記のコメントに関する回答やスレッドを表現するためのテーブル

```
t.string "name"
t.text "content"
t.integer "event_comment_id", null: false
t.datetime "created_at", null: false
t.datetime "updated_at", null: false
t.index ["event_comment_id"], name: "index_event_replies_on_event_comment_id"
```

### Event Tag テーブル

イベントの内容をタグとして登録するテーブル

```
t.string "name"
t.integer "event_id", null: false
t.datetime "created_at", null: false
t.datetime "updated_at", null: false
t.index ["event_id"], name: "index_event_tags_on_event_id"
```

# 環境構築

```
rbenv install 3.1.0
git clone https://github.com/takuya119/hackathon_project.git
bundle install
bundle exec rails s
```
