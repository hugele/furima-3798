# テーブル設計

## users テーブル

| Column                 | Type   | Options                 |
| -----------------------| ------ | ------------------------|
| nickname               | string | null: false             |
| email                  | string | null: false unique: true|
| encrypted_password     | string | null: false             |
| first_name             | string | null: false             |
| last_name              | string | null: false             |
| first_name_kana        | string | null: false             |
| last_name_kana         | string | null: false             |
| birth                  | date   | null: false             |

### Association

has_many   :items
has_many   :credit_cards


## addresses テーブル

| Column             | Type       | Options                            |
| -------------------| ------ ----| -----------------------------------|
| post_number        | string     | null: false                        |
| shipping_area_id   | integer    | null: false                        |
| city               | string     | null: false                        |
| address            | string     | null: false                        |
| building           | string     |                                    |
| phone              | string     | null: false                        |
| credit_card       | references  | null: false, foreign_key: true     |

### Association

belongs_to_:credit_card
belongs_to_active_hash :shipping_area



## credit_cards テーブル

| Column    | Type       | Options                               |
| --------- | ---------- | ------------------------------------- |
| user      | references | null: false, foreign_key: true        |
| item      | references | null: false, foreign_key: true        |


### Association

belongs_to :user
belongs_to :item
has_one    :address


## items テーブル

| Column              | Type       | Options                        |
| --------------------| ---------- | ------------------------------ |
| name                | string     | null: false,                   |
| about_item          | text       | null: false,                   |
| category_id         | integer    | null: false,                   |
| condition_id        | integer    | null: false,                   |
| shipping_cost_id    | integer    | null: false,                   |
| shipping_area_id    | integer    | null: false,                   |
| delivery_days_id    | integer    | null: false,                   |
| price               | integer    | null: false,                   |
| user                | references | null: false, foreign_key: true |

### Association

- has_one_attached  :image
- belongs_to        :user
  has_one   　　　　 :credit_card
　belongs_to_active_hash :category
  belongs_to_active_hash :day
  belongs_to_active_hash :derively_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :status

  ## image テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_id          | references | null: false, foreign_key: true |

belongs_to :item   

 