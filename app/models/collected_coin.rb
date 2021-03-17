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
    case
    when (coins < 1 && coins + value >= 1) && (coins < 100 && coins + value >= 100)
      user.trophys << Trophy.new(user_id: user.id, level: 1, trophy: "1 Coin collected")
      user.trophys << Trophy.new(user_id: user.id, level: 2, trophy: "100 Coins collected")
    when coins < 1 && coins + value >= 1
      user.trophys << Trophy.new(user_id: user.id, level: 1, trophy: "1 Coin collected")
    when coins < 100 && coins + value >= 100
      user.trophys << Trophy.new(user_id: user.id, level: 2, trophy: "100 Coins collected")
    when coins < 1000 && coins + value >= 1000
      user.trophys << Trophy.new(user_id: user.id, level: 3, trophy: "1000 Coins collected")
    when coins < 10000 && coins + value >= 10000
      user.trophys << Trophy.new(user_id: user.id, level: 4, trophy: "10000 Coins collected")
    when coins < 100000 && coins + value >= 100000
      user.trophys << Trophy.new(user_id: user.id, level: 5, trophy: "100000 Coins collected")
    end
  end
end
