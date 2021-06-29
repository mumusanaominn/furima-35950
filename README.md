# README

## users テーブル


| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| name_reading       | string | null: false |
| nickname           | string | null: false |


### Association
- has_many :donations
- has_many :items


## items テーブル


| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| title              | string | null: false |
| image              |        |             |
| text               | string | null: false |
| user_id            | text   | null: false |
| price              | integer    | null: false |
| exposition         | string   | null: false |
| details            | string   | null: false |
| shipping           | references | null: false, foreign_key: true  |
| price              | integer    | null: false |

### Association
- belongs_to :user
- has_one :donation


## addresses テーブル


| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| city               | string   | null: false |
| prefecture         | integer  | null: false |
| postal_code        | string   | null: false |
| house              | string   | null: false |
| building_name      | string   |             |
| donation           | references   | null: false, foreign_key: true |
| tel                | string | null: false |

### Association
- has_one :donations
- 
## donations テーブル


| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| user_id            | text   | null: false |
| item_id            | text   | null: false |


### Association
- belongs_to :user
- belongs_to :item
- belongs_to :addresses
