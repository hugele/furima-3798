# テーブル設計

## users テーブル

| Column                 | Type   | Options     |
| -----------------------| ------ | ----------- |
| nickname               | string | null: false |
| email                  | string | null: false |
| password               | string | null: false |
| first_name             | string | null: false |
| last_name              | string | null: false |
| first_name_kana        | string | null: false |
| last_name_kana         | string | null: false |
| birth                  | date   | null: false |

### Association

has_many   :items
belongs_to :card
belongs_to :address


## address テーブル

| Column        | Type   | Options                            |
| --------------| ------ | -----------------------------------|
| post_number   | string | null: false                        |
| prefecture    | string | null: false                        |
| city          | string | null: false                        |
| street        | string | null: false                        |
| address       | string | null: false                        |
| building      | string | null: false                        |
| phone         | string | null: false                        |
| user_id       | integer| null: false, foreign_key: true     |

### Association

belongs_to :user


## credit_card テーブル

| Column    | Type       | Options                               |
| --------- | ---------- | ------------------------------------- |
| user_id   | integer    | null: false, foreign_key: true        |
| item_id   | references | null: false, foreign_key: true        |


### Association

belongs_to :user
belongs_to :item


## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| text             | string     |                                |
| abot_item        | string     | null: false, foreign_key: true |
| condition        | integer    | null: false, foreign_key: true |
| shipping_cost    | integer    | null: false, foreign_key: true |
| shipping_area    | integer    | null: false, foreign_key: true |
| delivery_days    | integer    | null: false, foreign_key: true |
| price            | integer    | null: false, foreign_key: true |
| user_id          | references | null: false, foreign_key: true |
| catgory_id       | references | null: false, foreign_key: true |
| brand_id         | references |              foreign_key: true |

### Association

- has_one_attached :image
- belongs_to       :user
  belongs_to       :catgory
  belongs_to       :brand

  ## image テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_id          | references | null: false, foreign_key: true |

belongs_to :item   

  ## category テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false, foreign_key: true |

has_many :itemes 

## brand テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     |         foreign_key: true      |