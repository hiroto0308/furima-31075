# テーブル設計

## users テーブル

| column           | type   | options                   |
| ---------------- | ------ | ------------------------- |
| email            | string | null: false, unique: true |
| password         | string | null: false, unique: true |
| nickname         | string | null: false               |
| first_name       | string | null: false               |
| family_name      | string | null: false               |
| first_name_kana  | string | null: false               |
| family_name_kana | string | null: false               |
| birth_year       | string | null: false               |
| birth_month      | string | null: false               |
| birth_date       | date   | null: false               |



### Association 

- has_many : items
- has_many : purchases

## itemsテーブル

| column         | type          | options     |
| -------------- | ------------- | ----------- |
| item_img       | ActiveStorage | null: false |
| product_name   | string        | null: false |
| introduction   | text          | null: false |
| category       | string        | null: false |
| item_condition | string        | null: false |
| price          | integer       | null: false |
| delivery_fee   | string        | null: false |
| delivery_area  | string        | null: false |
| delivery_days  | string        | null: false |
| seller_id      | references    |             |



### Association

- belongs_to :user
- has_one    :purchase

## purchasesテーブル

| column   | type       | options |
| -------- | ---------- | ------- |
| buyer_id | references |         |
| item_id  | references |         |
| time     | datetime   |         |



### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addressesテーブル

| column        | type       | options     |
| ------------- | ---------- | ----------- |
| post_code     | integer    | null: false |
| prefectures   | string     | null: false |
| city          | string     | null: false |
| address       | string     | null: false |
| buliding_name | string     |             |
| phone         | integer    | null: false |
| purchase_id   | references |             |



### Association

- belongs_to :purchase