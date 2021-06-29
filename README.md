# README

## users テーブル


| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| reading       | string | null: false |
| nickname           | string | null: false |
| birthday           | string | null: false |


### Association
- has_many :donations
- has_many :items


## items テーブル


| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| title              | string | null: false |
| image              |        |             |
| text               | text | null: false |
| user_id            | text   | null: false, foreign_key: true |
| price              | integer    | null: false |
| exposition_id         | string   | null: false |
| details_id            | string   | null: false |
| shipping_id           | references | null: false, foreign_key: true  |

### Association
- belongs_to :user
- has_one :donation


## addresses テーブル


| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| city_id               | string   | null: false |
| prefecture_id         | integer  | null: false |
| postal_code_id        | string   | null: false |
| house_id              | string   | null: false |
| building_id      | string   |             |
| donation           | references   | null: false, foreign_key: true |
| tel_id                | string | null: false |

### Association
- belong_to :donations
- 
## donations テーブル


| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| user_id            | text   | null: false, foreign_key: true |
| item_id            | text   | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item
- has_one :addresses
