# DB設計

## users

| Column             | Type       | Options                        |
| ------------------ | ------     | -----------                    |
| email              | string     | null:false, unique:true        |
| password           | string     | nill:false                     |
| family_name        | string     | null:false                     |
| first_name         | string     | null:false                     |
| family_name_kana   | string     | null:false                     |
| first_name_kana    | string     | null:false                     |  
| birthday_year      | string     | null:false                     |
| birthday_month     | string     | null:false                     |
| birthday_day       | string     | null:false                     |
| nickname           | string     | null:false                     |

### Association
- has_many :items
- has_many :buys

## items
| Column             | Type       | Options                       |
| ------------------ | ------     | -----------                   |
| products           | string     | null:false                    |
| price              | string     | null:false                    |
| category           | string     | null:false                    |
| text               | string     | null:false                    |
| images             | string     | null:false                    |
| seller             | string     | null:false                    |
| state              | string     | null:false                    |
| postage            | string     | null:false                    |
| region             | string     | null:false                    |
| shipping_date      | string     | null:false                    |
| user_id            | references | null:false, foreign_key: true |

### Association
- belongs_to :users
- has_one buys

## buys
| Column             | Type       | Options                       |
| ------------------ | ------     | -----------                   |
| buyer              | string     | null:false                    |
| purchase           | string     | null:false                    |
| items_id           | references | null:false, foreign_key: true |
| uses_id            | references | null:false, foreign_key: true |

### Association
- belongs_to :items
- belongs_to :users
- has_one :addresses

## addresses
| Column             | Type       | Options                       |
| ------------------ | ------     | -----------                   |
| post_code          | string     | null:false                    |
| tel_number         | string     | null:false                    |
| ship_city          | string     | null:false                    |
| ship_address       | string     | null:false                    |
| street_address     | string     | null:false                    |
| building           | string     | null:false                    |
| buys_id            | references | null:false, foreign_key: true |

### Association
- belongs_to :buys