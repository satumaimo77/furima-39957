## usersテーブル

| Column | Type | Options  |
| ------ | ----- | --------- |
| email | string | null: false ,unique: true |
| encrypted_password | string | null: false |
| nickname | string | null: false |
| last_name | string | null: false |
| first_name | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
| birth_date | date | null: false |

### Association
- has_many :items
- has_many :orders

## itemsテーブル

| Column | Type | Options  |
| ------ | ----- | --------- |
| name | string | null: false |
| info | text | null: false |
| category | string | null: false |
| sales_status | string | null: false |
| shipping_fee_status | string | null: false |
| prefecture | string | null: false |
| scheduled_delivery | string | null: false |
| price | integer | null: false |
| user | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## ordersテーブル

| Column | Type       | Options                     |
| ------ | ---------- | --------------------------- |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :buyer_record

## buyer_recordsテーブル

| Column | Type | Options  |
| ------ | ----- | --------- |
| postal_cade | string | null: false |
| prefecture | string | null: false |
| city | string | null: false |
| addresses | string | null: false |
| building | string |  |
| phone_number | integer | null: false |
| order | references | null: false, foreign_key: true |

### Association
- belongs_to :order
