# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Hobbinity DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, index: true|
|email|string|null: false|
|password|string|null: false|
|image|string|
### Association
- has_many :messages
- has_many :group_users
- has_many :groups,through: :users_groups


## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|content|string|
|image|string|
### Association
- has_many :groups


## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|category_id|integer|null: false, foreign_key: true|
### Association
- has_many :groups_users
- has_many :users,though: :groups_users
- has_many :messages
- belongs_to :category


## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|content|string|null: false|
|image|string|null: false|
|group|references|null: false|
|user|references|null: false|
### Association
- belongs_to :group
- belongs_to :user


## group_user中間テーブル
|Column|Type|Options|
|------|----|-------|
|group_id|bigint|foreign_key: true|
|user_id|bigint|foreign_key: true|
### Association
- belongs_to :group
- belongs_to :user