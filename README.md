## users
|Column|Type|Options|
|------|----|-------|
| name            | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| first-name      | string  | null: false |
| last-name       | string  | null: false |
| kana-first-name | string  | null: false |
| knna-last-name  | string  | null: false |
| birth-date      | integer | null: false |

### Association
-has_many :items
-has_many :orders

## items
|Column|Type|Options|
|------|----|-------|
| image         | file      | null: false |
| title         | string    | null: false |
| text          | string    | null: false |
| category      | string    | null: false |
| condition     | string    | null: false |
| delivery-fee  | string    | null: false |
| shipping-area | string    | null: false |
| days-to-ship  | string    | null: false |
| price         | integer   | null: false |
| user_id       | referenes | null: false |

### Asociation
-belongs_to :user
-has_one :orders

## orders
|Column|Type|Options|
|------|----|-------|
| user_id   | referenes | null: false |  ←customer
| item_id   | referenes | null: false |
| user_id   | referenes | null: false |  ←seller

### Asociation
-belongs_to :user
-belongs_to :item

## adress
|Column|Type|Options|
|------|----|-------|
| post-code     | integer | null: false |
| prefecture    | text    | null: false |
| city          | text    | null: false |
| adress        | text    | null: false |
| building-name | text    | null: true |
| phone-number  | integer | null: false |
