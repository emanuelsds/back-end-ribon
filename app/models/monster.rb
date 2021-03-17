class Monster < ApplicationRecord
  has_many :killed_monsters
  has_many :users, through: :killed_monsters
end
