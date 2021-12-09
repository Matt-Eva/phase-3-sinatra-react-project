class User < ActiveRecord::Base
    has_many :creations, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :liked_creations, through: :likes, source: :creation
    has_many :comments, dependent: :destroy
    has_many :commented_creations, through: :comments, source: :creation
    has_many :donations, dependent: :destroy
    has_many :supported_creations, through: :donations, source: :creation
    has_many :lib_items, dependent: :destroy
    has_many :favorites, through: :lib_items, source: :creation
    has_many :flags, dependent: :destroy
    has_many :flagged_creations, through: :flags, source: :creation
end