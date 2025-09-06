# テーブル設計

## users テーブル

| Column            | Type   | Options                   |
| ----------------- | ------ | ------------------------- |
| nickname          | string | null: false               |
| email             | string | null: false, unique: true |
| encypted_password | string | null: false               |
| first_name        | string | null: false               |
| second_name       | string | null: false               |
| first_name_kana   | string | null: false               |
| second_name_kana  | string | null: false               |
| birthday          | date   | null: false               |

### Association

- has_many :items
- has_many :buyings

## items テーブル

| Column     | Type       | Options                       |
| ---------- | ---------- | ----------------------------- |
| name       | string     | null: false                   |
| caption    | text       | null: false                   |
| category   | string     | null: false                   |
| status     | string     | null: false                   |
| charged_by | string     | null: false                   |
| area       | string     | null: false                   |
| length     | string     | null: false                   |
| price      | integer    | null: false                   |
| user       | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- has_one :buying
- has_one :shipping

## buyings テーブル

| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null: false,foreign_key: true |
| item   | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping

## shippings テーブル

| Column     | Type       | Options                       |
| ---------- | ---------- | ----------------------------- |
| postcode   | integer    | null: false                   |
| prefecture | string     | null: false                   |
| city       | string     | null: false                   |
| building   | string     |                               |
| address    | string     | null: false                   |
| phone      | integer    | null: false                   |
| user       | references | null: false,foreign_key: true |
| item       | references | null: false,foreign_key: true |
| buying     | references | null: false,foreign_key: true |

### Association

- belongs_to user
- belongs_to item
- belongs_to buying
