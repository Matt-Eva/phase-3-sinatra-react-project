class User < ActiveRecord::Base
    has_many :creations
    has_many :likes
    has_many :liked_creations, through: :likes, source: :creations
    has_many :comments
    has_many :commented_creations, through: :comments, source: :creations
    has_many :donations
    has_many :supported_creations, through: :donations, source: :creations
    has_many :lib_items
    has_many :favorites, through: :lib_items, source: :creations
    has_many :flags
    has_many :flagged_creations, through: :flags, source: :creations
end