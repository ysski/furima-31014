# README

## users table

|        Column       |  Type  |   Options   |
|---------------------|--------|-------------|
| email               | string | null: false |
| encrypted_password  | string | null: false |
| nickname            | string | null: false |
| hiragana_name_first | string | null: false |
| hiragana_name_last  | string | null: false |
| katakana_name_first | string | null: false |
| katakana_name_lst   | string | null: false |
| date_of_birth_id    |  date  | null: false |

### Association

* has_many :items
* has_many :purchases


## items table

|        Column       |   Type        |      Options       |
|---------------------|---------------|--------------------| 
| category_id         | integer       | null: false        |
| condition_id        | integer       | null: false        |
| price               | integer       | null: false        |
| name                | string        | null: false        |
| description         | text          | null: false        |
| ship_from_id        | integer       | null: false        |
| days_to_ship_id     | integer       | null: false        |
| shipping_charges_id | integer       | null: false        |
| user                | references    | foreign_key: true  |

### Association

* belongs_to :user
* has_one :purchase



## purchases table

|Column|    Type    |      Options       |
|------|------------|--------------------|
| item | references | foreign_key: true  |
| user | references | foreign_key: true  |

### Association

* belongs_to :item
* belongs_to :user
* has_one :address



## addresses table

|     Column    |   Type      |      Options      |
|---------------|-------------|-------------------|
| postcode      | string      | null: false       |
| prefecture_id | integer     | null: false       |
| city          | string      | null: false       |
| street        | string      | null: false       |
| building_name | string      |                   |
| phone_number  | string      | null: false       |
| purchase      | references  | foreign_key: true |

### Association

* belongs_to :purchase