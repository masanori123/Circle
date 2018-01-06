# README

## users table

### password, email << devise

|Column|Type|Options|
|------|----|-------|
|name|string|index: true, null: false||
|body|text||
|image|string||
|team_name|string|null: false||
|region|string|null: false||
|result|text||
|info_id|integer|null; false, freign_key: true||
|category_id|integer|null: false, freign_key: true||

### Association
- has_many    :messages
- has_many    :contacts
- has_many    :members
- has_many    :groups, through: :members
- has_many    :any_informations
- has_many    :informations, through: :any_informations
- has_many    :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
- has_many    :followings, through: :following_relationships
- has_many    :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
- has_many    :followers, through: :follower_relationships
- belongs_to  :category



##messages table

|Colunm|Type|Option|
|------|----|------|
|body|text||
|image|string||
|group_id|integer|null: false, freign_key: true||
|user_id|integer|null: false, freign_key: true||

### Association
- belongs_to :user
- belongs_to :group

##groups table
|group_name|string|null: false||

### Association
- has_many :messages
- has_many :members
- has_many :users, through: :members

## members table

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true||
|group_id|integer|null: false, foreign_key: true||

### Association
- belongs_to :group
- belongs_to :user

## categories table

|Column|Type|Options|
|------|----|-------|
|category_name|string||

### Association
- has_many :users

## contacts table
|Column|Type|Options|
|------|----|-------|
|text|text|
|user_id|integer|null_false, foreign_key: true||

### Association
- belongs_to :user

## informations table
|Column|Type|Options|
|title|string|null: false||
|body|text|null: false||

### Association
- has_many :any_informations
- has_many :users, through: :any_informations

## any_informations table
|Column|Type|Options|
|user_id|integer|null: false, foreign_key: true||
|information_id|integer|null: false, foreign_key: true||


### Association
- belongs_to :information
- belongs_to :user

## relationships table
|Column|Type|Options|
|------|----|-------|
|follower_id|integer|null: false||
|following_id|integer|null: false||

### Association
- belongs_to :user
