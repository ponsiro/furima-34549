# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------  | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name_kana     | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :items
- has_many :purchase_histories

## items テーブル

| Column                 | Type      | Options                        |
| ---------------------- | --------- | ------------------------------ |
| name                   | string    | null: false                    |
| about                  | text      | null: false                    |
| category_id            | integer   | null: false                    |
| status_id              | integer   | null: false                    |
| delivery_fee_burden_id | integer   | null: false                    |
| shipment_source_id     | integer   | null: false                    |
| delivery_day_id        | integer   | null: false                    |
| price                  | integer   | null: false                    |
| user_id                | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_history


## purchase_history テーブル

| Column    | Type      | Options                        |
| --------- | --------- | ------------------------------ |
| user_id   | reference | null: false, foreign_key: true |
| item_id   | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :card
- has_one :buyer_address


## cards テーブル

| Column              | Type      | Options                        |
| ------------------- | --------- | ------------------------------ |
| purchase_history_id | reference | null: false, foreign_key: true |
| card_number         | integer   | null: false                    |
| expiration_date     | integer   | null: false                    |
| security_code       | integer   | null: false                    |

### Association

- belongs_to :purchase_history

## buyer_address テーブル

| Column                | Type      | Options                        |
| --------------------- | --------- | ------------------------------ |
| purchase_history_id   | reference | null: false, foreign_key: true |
| postal_code           | string    | null: false                    |
| prefecture_id         | integer   | null: false                    |
| city                  | string    | null: false                    |
| address_line_block    | string    | null: false                    |
| address_line_building | string    |                                |
| phone_number          | string    | null: false                    |

### Association

- belongs_to : purchase_history