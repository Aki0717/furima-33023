## users
|Column              |Type     |Options                   |
|--------------------|---------|--------------------------|
| name               | string  | null: false              |
| email              | string  | null: false, unique: true|
| encryted-password  | string  | null: false              |
| first-name         | string  | null: false              |
| last-name          | string  | null: false              |
| kana-first-name    | string  | null: false              |
| knna-last-name     | string  | null: false              |
| birth-date         | date    | null: false              |

### Association
-has_many :items
-has_many :orders

## items
|Column            |Type       |Options                         |
|------------------|-----------|--------------------------------|
| title            | string    | null: false                    |
| text             | string    | null: false                    |
| category_id      | integer   | null: false                    |
| condition_id     | integer   | null: false                    |
| delivery-fee_id  | integer   | null: false                    |
| shipping-area_id | integer   | null: false                    |
| days-to-ship_id  | integer   | null: false                    |
| price            | integer   | null: false                    |
| user             | referenes | null: false, foreign_key: true |

### Asociation
-belongs_to :user
-has_one :orders

## orders
|Column  |Type       |Options                          |
|--------|-----------|---------------------------------|
| user   | referenes | null: false, foreign_key: true  |
| item   | referenes | null: false, foreign_key: true  |
購入者と販売者の切り分けをやらなくてもいいのか疑問点です（本来はこちらに記載しないと思うのですが提出もかねて質問できれば幸いです。）

### Asociation
-belongs_to :user
-belongs_to :item
-has_one :adresses

## adresses
|Column         |Type    |Options      |
|---------------|--------|-------------|
| post-code     | string | null: false |
| prefecture    | text   | null: false |
| city          | text   | null: false |
| adress        | text   | null: false |
| building-name | text   |             |
| phone-number  | string | null: false |

### Asociation
-belongs_to :order
