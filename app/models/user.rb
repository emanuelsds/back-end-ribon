class User < ApplicationRecord
    has_many :collected_coins
    has_many :killed_monsters
    has_many :deaths
end
