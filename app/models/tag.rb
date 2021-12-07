class Tag < ActiveRecord::Base
    has_many :taglinks
    has_many :creations, through: :taglinks
end