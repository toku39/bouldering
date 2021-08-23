# アプリケーション名

Bouldering Record(ボルレコ)

## アプリケーション概要

ボルダリングの課題の投稿・記録・共有ができるアプリケーション。

## 制作背景

友達がボルダリングの課題の投稿・記録アプリを求めていたが、いいものがないと言ってたので作りました。

## 工夫した点

非同期通信でのいいね機能を実装したこと
7つのアクションを全て使ってるところ

## デプロイ済みのURL

https://bouldering-395.herokuapp.com/

## ユーザー認証

ユーザー名 admin
パスワード 2222

## テスト用アカウント

| name | email    | password |
| ---- | -------  | -------- |
| a    | aaaa@aaa | aaa111   |
| b    | bbbb@bb  | bbb111   |

## 今後実装したい機能

## 実装機能紹介GIF

課題投稿機能
[![Image from Gyazo](https://i.gyazo.com/3f154e52700caed54d35ba2fa0efb2d4.gif)](https://gyazo.com/3f154e52700caed54d35ba2fa0efb2d4)

投稿一覧機能
[![Image from Gyazo](https://i.gyazo.com/1ceb640703b0aad881e3f078fc95e25d.gif)](https://gyazo.com/1ceb640703b0aad881e3f078fc95e25d)

いいね機能（非同期通信）
[![Image from Gyazo](https://i.gyazo.com/0a2d70858402ca51ad0be0a9cba008aa.gif)](https://gyazo.com/0a2d70858402ca51ad0be0a9cba008aa)

コメント機能
[![Image from Gyazo](https://i.gyazo.com/397a1d60db2d795d7107fa4609599d99.gif)](https://gyazo.com/397a1d60db2d795d7107fa4609599d99)

## 要件定義
### 優先順位

|（高：3、中：2、低：1）| 機能 | 目的 | 詳細 | ストーリー(ユースケース) | 見積もり所要時間 |
| --------------------- | ---- | ---- | ---- | ------------------------ | ---------------- |
| 3                     | 課題投稿機能 | ボルダリングの課題を投稿する | 複数条件を指定した上で投稿を可能にする | 課題の写真、セッター、グレード、メモ、壁の形状・場所、完登・未完登の一つでも欠けていると投稿できない。 | 1日 |
| 3 | ユーザー管理機能 |ログインユーザーしか投稿出来ない様に制限する|コントローラーによる制御を可能にする|ログインしているユーザーしか投稿出来ない|1日|
| 2 | 投稿編集機能 | 入力した内容を変更したい時、変更できるようにする | 投稿詳細ボタンを押した時、詳細ページで投稿者本人であれば、編集ボタンが表示される。編集ボタンを押すと編集ページに遷移し、編集することができる。 | 投稿者本人が、入力内容を変更したいと思った時に編集する。 | 4時間 |
| 2 | 投稿更新機能 | 入力内容を編集し、その内容を保存し、更新する | 編集ページにて、編集後、[変更する]ボタンを押すと変更内容が更新される。編集内容に不備[空欄]があった場合は、更新できず、編集ページにとどまる 編集と更新はセットで使用。 | 編集した内容を反映したい場合に更新する。編集内容に不備[空欄]などがあれば更新できない。 | 1時間 |
| 2 | 投稿削除機能 | 投稿している内容を削除できるようにする。 | 投稿者本人であれば詳細ページに遷移した際に、削除ボタンが表示される。削除ボタンを押すと、削除完了となる。 | ユーザーが入力情報を削除したいと思った時に削除することができる。 | 1時間 |
| 2 | 投稿詳細機能 | 詳細ページで投稿内容を確認できるようにする。 | トップページの投稿一覧画面で、投稿されている課題の写真を押すと、詳細ページに遷移する。投稿者本人の詳細であれば過去に投稿した内容の一覧を降順で表示させ、編集、削除のボタンを表示する。投稿者以外のユーザーが詳細ページに遷移した場合は、投稿されている内容、いいねボタン、コメント欄が表示される。 | 投稿の詳しい内容を確認できる。 | 9時間 |
| 2 | 投稿一覧機能 | 他者の投稿を閲覧できるようにする。他者の投稿にいいねをできるようにする。 | 課題投稿機能で入力した内容の全てを、降順でトップページに表示させる。一覧表示では、他者の投稿内容も全て閲覧することができる。一覧表示で、いいねを非同期通信で行うことができる。 | 他社が登った・作った課題を知りたい時にトップページで閲覧することができる。その際にいいねを押すことができる。 | 7時間 |
| 2 | コメント機能 | 投稿にコメントすることができる。 | 投稿詳細ページにて、投稿内容についてコメントをすることができる。ログインされていない場合コメントのフォームは表示されない。 | 他社が登った・作った課題にコメントすることができる。 | 7時間 |
| 2 | いいね機能 | 良い投稿にはいいねを押すことができる。 | トップページの一覧表示、詳細ページ、ユーザー詳細ページにていいねができる。非同期通信で実装している。いいねが押されているときは、赤色になり、押されていない状態では、グレーになる。良いねは、一人1カウントづつできる。いいねしたボタンを再度クリックすることでいいねの解除も可能。 | 他者の投稿、自身の投稿に対して、気に入ったことを表現したい場合に、トップページの一覧表示、詳細ページ、ユーザー詳細ページからいいねが可能。間違っていいねしてしまっても、再度ボタンを押すことで解除が可能。 | 2日 |
| 1 | ユーザー詳細機能 | ユーザーが投稿した内容を表示することができる。 | ユーザー名を押すとユーザー詳細ページに遷移する。ユーザーが過去に投稿した内容の一覧を降順で表示させる。 | ユーザーが投稿した全ての課題を見ることができる。 | 1日 |
| 1 | プレビュー機能 | 課題投稿時、選択した画像のプレビューが表示することができる。 | 課題投稿時、選択した画像のプレビューが表示することができる。編集画面でも表示することができる。 | 投稿前に画像を確認できることで画像の選択ミスをなくすことができる | 1 |



## モデル単体テストコードGIF

[![Image from Gyazo](https://i.gyazo.com/b5603472a0da323989c5ac2066f53171.png)](https://gyazo.com/b5603472a0da323989c5ac2066f53171)

## データベース設計
[![Image from Gyazo](https://i.gyazo.com/80cff5c9cc1170f91c2ac52d4c9955d9.png)](https://gyazo.com/80cff5c9cc1170f91c2ac52d4c9955d9)


## users テーブル

| Column                 | Type   | Options                   |
| ---------------------- | ------ | ------------------------- |
| name                   | string | null: false               |
| email                  | string | null: false, unique: true |
| encrypted＿password    | string | null: false               |

### Association
- has_many :problems
- has_many :comments
- has_many :likes, dependent: :destroy


## problems テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| setter        | string     | null: false                    |
| grade_id      | integer    | null: false                    |
| area          | string     | null: false                    |
| memo          | text       | null: false                    |
| user          | references | null: false, foreign_key: true |
| climb_done_id | integer    | null: false                    |

### Association
- belongs_to :grade
- belongs_to :climb_done
- belongs_to :user
- has_one_attached :image
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy


## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| text         | text       |                                |
| user         | references | null: false, foreign_key: true |
| problem      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :problem


## likes テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| user                   | references | null: false, foreign_key: true |
| problem                | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :problem

## パッケージ 

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.0'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 4.0.0'
  gem 'factory_bot_rails'
  gem 'faker'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop', require: false
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'devise'
gem 'active_hash'
gem 'mini_magick'
gem 'image_processing', '~> 1.2'
gem 'pry-rails'
gem 'font-awesome-sass'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem "omniauth-rails_csrf_protection"
gem 'omniauth', '~>1.9.1'
