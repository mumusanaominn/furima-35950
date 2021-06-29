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
| price              | text   | null: false |
### Association
- belongs_to :user

## addresses テーブル


| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| city               | string   | null: false |
| prefecture         | integer  | null: false |
| postal_code        | string   | null: false |
| house              | string   | null: false |
| building_name      | string   | null: false |
| donation           | references   | null: false, foreign_key: true |
| tel                | string | null: false |

### Association
- belongs_to :user
- 
## donations テーブル


| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| shipping           | references | null: false, foreign_key: true  |
| price              | integer    | null: false |
| items              | string   | null: false |
| text               | string   | null: false |
| exposition         | string   | null: false |
| details            | string   | null: false |

### Association
- belongs_to :user