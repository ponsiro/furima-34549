# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------  | ----------- |
| email           | string  | null: false |
| password        | string  | null: false |
| nickname        | string  | null: false |
| full_width_name | string  | null: false |
| half_size_name  | string  | null: false |
| birthday        | integer | null: false |

### Association

- has_many :user_items
- has_many :items, through: user_items

## items テーブル

| Column              | Type    | Options     |
| ------------------- | ------  | ----------- |
| item_name           | string  | null: false |
| item_about          | text    | null: false |
| category            | string  | null: false |
| status              | string  | null: false |
| delivery_fee_burden | string  | null: false |
| shipment_source     | string  | null: false |
| delivery_day        | string  | null: false |
| price               | integer | null: false |

### Association

- has_many :user_items
- has_many :users, through: user_items


## user_items テーブル

| Column | Type      | Options                        |
| ------ | --------- | ------------------------------ |
| user   | reference | null: false, foreign_key: true |
| item   | reference | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :card
- has_one :buyer_address


## cards テーブル

| Column          | Type      | Options                        |
| --------------- | --------- | ------------------------------ |
| user            | reference | null: false, foreign_key: true |
| card_number     | integer   | null: false                    |
| expiration_date | integer   | null: false                    |
| security_code   | integer   | null: false                    |

### Association

- belongs_to :user_item 

## buyer_address テーブル

| Column        | Type      | Options                        |
| ------------- | --------- | ------------------------------ |
| user          | reference | null: false, foreign_key: true |
| postal_code   | integer   | null: false                    |
| prefecture    | string    | null: false                    |
| city          | string    | null: false                    |
| address_line1 | string    | null: false                    |
| address_line2 | string    | null: false                    |
| phone_number  | integer   | null: false                    |

### Association

- belongs_to :user_item