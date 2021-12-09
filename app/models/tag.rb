class Tag < ActiveRecord::Base
    has_many :taglinks, dependent: :destroy
    has_many :creations, through: :taglinks
end