class CollectedCoin < ApplicationRecord
  belongs_to :user

  validates :value, presence: true

  before_create :check_trophy

  private

  def check_trophy
    coins = user.collected_coins.pluck(:value).inject(:+)
    coins = coins.nil? ? 0 : coins
    puts "AAAAAAAAAAAAAAAAAAAAAAAA #{coins} + #{value}}"
    puts
    if (coins < 1 && coins + value >= 1) && (coins < 100 && coins + value >= 100)
      user.trophys << Trophy.new(user_id: user.id, level: 1, trophy: '1 Coin collected')
      user.trophys << Trophy.new(user_id: user.id, level: 2, trophy: '100 Coins collected')
    elsif coins < 1 && coins + value >= 1
      user.trophys << Trophy.new(user_id: user.id, level: 1, trophy: '1 Coin collected')
    elsif coins < 100 && coins + value >= 100
      user.trophys << Trophy.new(user_id: user.id, level: 2, trophy: '100 Coins collected')
    elsif coins < 1000 && coins + value >= 1000
      user.trophys << Trophy.new(user_id: user.id, level: 3, trophy: '1000 Coins collected')
    elsif coins < 10_000 && coins + value >= 10_000
      user.trophys << Trophy.new(user_id: user.id, level: 4, trophy: '10000 Coins collected')
    elsif coins < 100_000 && coins + value >= 100_000
      user.trophys << Trophy.new(user_id: user.id, level: 5, trophy: '100000 Coins collected')
    end
  end
end
