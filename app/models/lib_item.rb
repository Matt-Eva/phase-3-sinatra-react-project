class LibItem < ActiveRecord::Base
    belongs_to :user
    belongs_to :creation
end