# アプリケーション名

Bouldering Record(ボルレコ)

## アプリケーション概要

ボルダリングの課題(登るコース)の投稿・記録・共有ができるアプリケーション。

## 制作背景

友達がボルダリングの課題の投稿・記録アプリを求めていたが、いいものがないと言ってたので作りました。

## 工夫した点

非同期通信でのいいね機能を実装したこと
googleとfacebookアカウントでログインできるようにしたこと
7つのアクションを全て使ってるところ

## デプロイ済みのURL

https://bouldering-395.herokuapp.com/

## ユーザー認証

ユーザー名 admin
パスワード 2222

## テスト用アカウント

| name | email    | password |
| ---- | -------  | -------- |
| テスト１ | test1@gmail.com | test11 |
| テスト２ | test2@gmail.com | test22 |

## 今後実装したい機能
画像の加工機能

## 実装機能紹介GIF

課題投稿機能
[![Image from Gyazo](https://i.gyazo.com/3f154e52700caed54d35ba2fa0efb2d4.gif)](https://gyazo.com/3f154e52700caed54d35ba2fa0efb2d4)

投稿一覧機能
[![Image from Gyazo](https://i.gyazo.com/1ceb640703b0aad881e3f078fc95e25d.gif)](https://gyazo.com/1ceb640703b0aad881e3f078fc95e25d)

いいね機能（非同期通信）
[![Image from Gyazo](https://i.gyazo.com/0a2d70858402ca51ad0be0a9cba008aa.gif)](https://gyazo.com/0a2d70858402ca51ad0be0a9cba008aa)

コメント機能
[![Image from Gyazo](https://i.gyazo.com/397a1d60db2d795d7107fa4609599d99.gif)](https://gyazo.com/397a1d60db2d795d7107fa4609599d99)



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

gem "aws-sdk-s3", require: false
