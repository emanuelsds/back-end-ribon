class CollectedCoin < ApplicationRecord
  belongs_to :user

  validates :value, presence: true

  before_create :check_coins

  private

  def check_coins
    coins = user.collected_coins.pluck(:value).inject(:+)
    coins = coins.nil? ? 0 : coins
    coin_value = value
    check_trophy(coin_value, coins)
  end

  def check_trophy(coin_value, coins)
    trophy_lvl = if coins < 1 && coins + coin_value >= 1
                   0
                 elsif coins < 100 && coins + coin_value >= 100
                   1
                 elsif coins < 1000 && coins + coin_value >= 1000
                   2
                 elsif coins < 10_000 && coins + coin_value >= 10_000
                   3
                 elsif coins < 100_000 && coins + coin_value >= 100_000
                   4
                 else
                   -1
                 end
    set_trophy(trophy_lvl)
  end

  def set_trophy(trophy_lvl)
    return if trophy_lvl == -1

    trophy_value = trophy_lvl > 0 ? trophy_lvl + 1 : trophy_lvl
    user.trophys << Trophy.new(user_id: user.id, level: trophy_lvl + 1,
                               trophy: "1#{'0' * trophy_value} Coins collected")
  end
end
