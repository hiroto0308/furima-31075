# テーブル設計

## users テーブル

| column             | type   | options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| first_name         | string | null: false               |
| family_name        | string | null: false               |
| first_name_kana    | string | null: false               |
| family_name_kana   | string | null: false               |
| birthday           | date   | null: false               |





### Association 

- has_many : items
- has_many : purchases

## itemsテーブル

| column            | type          | options           |
| ----------------- | ------------- | ----------------- |
| item_img          | ActiveStorage | null: false       |
| product           | string        | null: false       |
| introduction      | text          | null: false       |
| category_id       | integer       | null: false       |
| item_condition_id | integer       | null: false       |
| price             | integer       | null: false       |
| delivery_fee_id   | integer       | null: false       |
| delivery_area_id  | integer       | null: false       |
| delivery_days_id  | integer       | null: false       |
| user              | references    | foreign_key: true |




### Association

- belongs_to :user
- has_one    :purchase

## purchasesテーブル

| column  | type       | options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| item_id | references |                   |
| time    | datetime   |                   |



### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addressesテーブル

| column         | type       | options           |
| -------------- | ---------- | ----------------- |
| post_code      | integer    | null: false       |
| prefectures_id | integer    | null: false       |
| city           | string     | null: false       |
| address        | string     | null: false       |
| buliding_name  | string     |                   |
| phone          | string     | null: false       |
| purchase_id    | references | foreign_key: true |




### Association

- belongs_to :purchase