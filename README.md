## users
|Column              |Type     |Options                   |
|--------------------|---------|--------------------------|
| name               | string  | null: false              |
| email              | string  | null: false, unique: true|
| encrypted-password  | string  | null: false              |
| first_name         | string  | null: false              |
| last_name          | string  | null: false              |
| kana_first_name    | string  | null: false              |
| kana_last_name     | string  | null: false              |
| birth_date         | date    | null: false              |

### Association
-has_many :items
-has_many :orders

## items
|Column            |Type       |Options                         |
|------------------|-----------|--------------------------------|
| title            | string    | null: false                    |
| text             | text      | null: false                    |
| category_id      | integer   | null: false                    |
| condition_id     | integer   | null: false                    |
| delivery_fee_id  | integer   | null: false                    |
| shipping_area_id | integer   | null: false                    |
| days_to_ship_id  | integer   | null: false                    |
| price            | integer   | null: false                    |
| user             | referenes | foreign_key: true              |

### Asociation
-belongs_to :user
-has_one :order

## orders
|Column  |Type       |Options                          |
|--------|-----------|---------------------------------|
| user   | referenes | null: false, foreign_key: true  |
| item   | referenes | null: false, foreign_key: true  |

### Asociation
-belongs_to :user
-belongs_to :item
-has_one :adress

## adresses
|Column          |Type        |Options            |
|----------------|------------|-------------------|
| post_code      | string     | null: false       |
| prefecture_id  | integer    | null: false       |
| city           | string     | null: false       |
| adress         | string     | null: false       |
| building_name  | string     |                   |
| phone_number   | string     | null: false       |
| order          | references | foreign_key: true |

### Asociation
-belongs_to :order
