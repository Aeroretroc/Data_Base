# Project Database
Database of rooms booking system

## Logical Model
![logical_model](https://user-images.githubusercontent.com/72448245/232317111-9af4d774-5aa7-4af7-bd1c-9cf0508752cb.png)

## Physical Model
#### Table 1: hosts
| Column Name | Description | Data Type |
| --- | --- | --- |
| host_id | Unique identifier for each host | int |
| host_name | The first name of the host | varchar(50) |
| host_surname | The last name of the host | varchar(50) |

#### Table 2: users
| Column Name | Description | Data Type |
| --- | --- | --- |
| user_id | Unique identifier for each user | int |
| name | The first name of the user | varchar(50) |
| surname | The last name of the user | varchar(50) |
| email | The email address of the user | varchar(50) |
| password | The password of the user | varchar(50) |
| phone | The phone number of the user | varchar(20) |

#### Table 3: loyalty_card
| Column Name | Description | Data Type |
| --- | --- | --- |
| card_id | Unique identifier for each loyalty card | int |
| user_id | The user associated with the loyalty card | int |
| name | The first name of the card holder | varchar(50) |
| surname | The last name of the card holder | varchar(50) |
| discount | The discount percentage associated with the card | int |
| expiration_date | The expiration date of the card | date |


#### Table 4: amenities
| Column Name | Description | Data Type |
| --- | --- | --- |
| amenity_id | Unique identifier for each amenity | int |
| amenity_name | The name of the amenity | varchar(50) |

#### Table 5: rooms
| Column Name | Description | Data Type |
| --- | --- | --- |
| room_id | Unique identifier for each room | int |
| host_id | The host associated with the room | int |
| amenity_id | The amenity associated with the room | int |
| room_price | The price of the room | decimal(8,2) |
| address | The address of the room | varchar(100) |
| country | The country of the room | varchar(50) |
| city | The city of the room | varchar(50) |
| availability | The availability date of the room | date |
| room_type | The type of the room | varchar(50) |


#### Table 6: reservations
| Column Name | Description | Data Type |
| --- | --- | --- |
| reservation_id | Unique identifier for each reservation | int |
| user_id | The user associated with the reservation | int |
| card_id | The loyalty card associated with the reservation | int |
| room_id | The room associated with the reservation | int |
| start_date | The start date of the reservation | date |
| end_date | The end date of the reservation | date |
| price | The price of the reservation | decimal(8,2) |
| price_with_discount | The price of the reservation with discount applied | decimal(8,2) |


#### Table 7: reviews
| Column Name | Description | Data Type |
| --- | --- | --- |
| review_id | Unique identifier for each review | int |
| reservation_id | The reservation associated with the review | int |
| rating | The rating given in the review | int |
| comment | The comment given in the review | text |
| date | The date the review was posted | date |


## Tasks
[Task 3](https://github.com/Aeroretroc/Data_Base/blob/main/scripts/tables_ddl.sql) -br+
[Task 4](https://github.com/Aeroretroc/Data_Base/blob/main/scripts/inserts1.sql)

