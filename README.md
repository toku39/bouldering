# アプリケーション名

Bouldering Record(ボルレコ)

## アプリケーション概要

ボルダリングの課題の投稿・記録・共有ができるアプリケーション。

## 制作背景

友達がボルダリングの課題の投稿・記録アプリを求めていたが、いいものがないと言ってたので作りました。

## 工夫した点

非同期通信でのいいね機能を実装したこと

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

## 要件定義

### 優先順位

|（高：3、中：2、低：1）| 機能         | 目的             | 詳細 | ストーリー(ユースケース) | 見積もり所要時間 |
| --------------------- | ------------ | ---------------- | ---- | ------------------------ | ---------------- |
| 3                     | 課題投稿機能 | ボルダリングの課題を投稿する | 複数条件を指定した上で投稿を可能にする | 課題の写真、セッター、グレード、メモ、壁の形状・場所、完登・未完登の一つでも欠けていると投稿できない。 | 1日 |
| 3 | ユーザー管理機能 |ログインユーザーしか投稿出来ない様に制限する|コントローラーによる制御を可能にする|ログインしているユーザーしか投稿出来ない|1日|
| 2 | 投稿編集機能 | 入力した内容を変更したい時、変更できるようにする | 投稿詳細ボタンを押した時、詳細ページで投稿者本人であれば、編集ボタンが表示される。編集ボタンを押すと編集ページに遷移し、編集することができる。 | 投稿者本人が、入力内容を変更したいと思った時に編集する。 | 4時間 |
| 2 | 投稿更新機能 | 入力内容を編集し、その内容を保存し、更新する | 編集ページにて、編集後、[変更する]ボタンを押すと変更内容が更新される。編集内容に不備[空欄]があった場合は、更新できず、編集ページにとどまる 編集と更新はセットで使用。 | 






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

## 使用技術