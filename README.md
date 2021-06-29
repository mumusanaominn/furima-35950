# README

## users テーブル


| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| email              | string   | null: false |
| encrypted_password | string   | null: false |
| nickname           | string   | null: false |
| last_name          | string   | null: false |
| first_name         | string   | null: false |
| kata_name          | string   | null: false |
| kana_name          | string   | null: false |
| birthday           | datetime | null: false |


### Association

- has_many :orders
- has_many :items


## items テーブル


| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| title              | string       | null: false                    |
| text               | text         | null: false                    |
| user               | references   | null: false, foreign_key: true |
| category_id        | string       | null: false                    |
| condition_id       | string       | null: false                    |
| load_id            | string       | null: false                    |
| area_id            | string       | null: false                    |
| shipping_id        | string       | null: false                    |
| price              | integer      | null: false                    |


### Association

- belongs_to :user
- has_one :order


## addresses テーブル


| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal             | string     | null: false                    |
| area_id            | integer    | null: false                    |
| city               | string     | null: false                    |
| house              | string     | null: false                    |
| building           | string     |                                |
| tel                | string     | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association

- belong_to :order

## orders テーブル


| Column             | Type         | Options                        |
| ------------------ | ------------ | ------------------------------ |
| user               | references   | null: false, foreign_key: true |
| item               | references   | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :address
