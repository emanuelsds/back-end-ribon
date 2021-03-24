class User < ApplicationRecord
  has_many :collected_coins
  has_many :killed_monsters
  has_many :deaths
  has_many :trophys

  validates :name, uniqueness: { message: 'Usuário ja existente' }
  validates :name, presence: { message: 'Nome do usuário não pode ser vazio' }
  validates :name, length: { in: 2..20 }
  validates :coins, presence: true
end
