# README

# サービス概要

- 公共施設の稼働率が低くあまり知られてない
- 自治体・施設ごとに HP が別れており、使用用途や予約方法を調べにくい

上記 2 つの問題を解消し、都民と公共施設のインターフェースの役割を担うサービスを考えています。

[稼働率を参考にしたページ](https://www.soumu.metro.tokyo.lg.jp/05gyousei/04kusichousonkoukyoushisetsu.html)

[https://www.city.shinjuku.lg.jp/content/000211415.pdf](https://www.city.shinjuku.lg.jp/content/000211415.pdf)

上記 URL にある PDF の p45~6 から抜粋した新宿区民の意見

- せっかくある区有施設が、区民に知られていないことが多いと思います。周知方法を（できるだけ低価格の方法にする等）検討したうえで、効果的に区民に知らせることをお願いしたいです。
- 区有施設の活動内容や取組み、施設の利便性などがあまり広く認識されていない。地域へのあり方を広くアピールすべき。
- もっと利用者を増やすべきＰＲ活動をもっと積極的にしてほしい。少人数の参加者で実にもったいない（お知らせの範囲が少ない。工夫して一考を要すると思います）。

# 環境構築

```
rbenv install 3.1.0
git clone https://github.com/takuya119/hackathon_project.git
bundle install
bundle exec rails s
```
