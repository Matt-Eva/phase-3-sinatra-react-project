class User < ActiveRecord::Base
    has_many :creations, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :liked_creations, through: :likes, source: :creations
    has_many :comments, dependent: :destroy
    has_many :commented_creations, through: :comments, source: :creations
    has_many :donations, dependent: :destroy
    has_many :supported_creations, through: :donations, source: :creations
    has_many :lib_items, dependent: :destroy
    has_many :favorites, through: :lib_items, source: :creations
    has_many :flags, dependent: :destroy
    has_many :flagged_creations, through: :flags, source: :creations
end