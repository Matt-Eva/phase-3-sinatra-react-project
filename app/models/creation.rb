class Creation < ActiveRecord::Base
    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :donations, dependent: :destroy
    has_many :lib_items, dependent: :destroy
    has_many :flags, dependent: :destroy
    has_many :taglinks, dependent: :destroy
    has_many :tags, through: :taglinks

    def ranking
        likes = self.likes.length
        lib_adds = self.lib_items.length
        donations = self.donations.length
        flags = self.flags.length

        rank = likes + (lib_adds * 10) + (donations * 100) - (flags * 50)
        rank
    end

    def self.order_all
        self.all.sort_by{|a| -(a.ranking)}.slice(0, 501)
    end
end