# README

T# README

## _usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |


- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :messages




## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages
- has_many :tasks


## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

- belongs_to :room
- belongs_to :user
- has_many :tasks

## tasks テーブル
| Column             | Type       | Options                        |
| -------            | ---------- | ------------------------------ |
| task               | string     | null:false                     |
| content            | text       | null: false,                   |
| date_of_schedue    | data       | null: false,                   |
| is_completed       | boolean    | null: false,  default:false   |
| user               | references | null: false, foreign_key: true |
| room               | references | null: false, foreign_key: true |


- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | string     |                                |
| user    | references | null: false, foreign_key: true |
| task    | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :task

