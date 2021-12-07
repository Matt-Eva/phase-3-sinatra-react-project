class Creation < ActiveRecord::Base
    belongs_to :user
    has_many :likes
    has_many :comments
    has_many :donations
    has_many :lib_items
    has_many :flags
    has_many :taglinks
    has_many :tags, through: :taglinks
end