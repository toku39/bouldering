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