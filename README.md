# README

## users table

|        Column       |  Type  |   Options   |
|---------------------|--------|-------------|
| email               | string | null: false |
| password            | string | null: false |
| name                | string | null: false |
| nickname            | string | null: false |
| hiragana_name_first | string | null: false |
| hiragana_name_last  | string | null: false |
| katakana_name_first | string | null: false |
| katakana_name_lst   | string | null: false |
| date_of_birth_year  | integer| null: false |
| date_of_birth_month | integer| null: false |
| date_of_birth_day   | integer| null: false |

### Association

* has_many :items
* has_many :purchases


## items table

|    Column   |  Type  |   Options   |
|-------------|--------|-------------| 
| seller      | string | null: false |
| category    | string | null: false |
| condition   | string | null: false |
| price       | integer| null: false |
| item_name   | text   | null: false |
| description | text   | null: false |

### Association

* belongs_to :user
* has_one :purchase


## purchases table

|Column|    Type    |      Options       |
|------|------------|--------------------|
| item | references | foreign_keys: true |
| user | references | foreign_keys: true |

### Association

* belongs_to :item
* has_one :address

## addresses table

|     Column    |   Type  |   Options   |
|---------------|---------|-------------|
| postcode      | integer | null: false |
| prefectures   | string  | null: false |
| city          | string  | null: false |
| street        | string  | null: false |
| building_name | string  | null: false |
| phone_number  | integer | null: false |

### Association

* belongs_to :purchase