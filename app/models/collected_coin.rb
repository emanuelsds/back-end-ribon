class CollectedCoin < ApplicationRecord
  belongs_to :user

  validates :value, presence: true

  before_create :check_trophy

  after_create :update_user_coins

  private
  def check_trophy
    coins = user.coins
    coin_value = value
    trophy_lvl = if coins < 1 && coins + coin_value >= 1
                   [1, 1]
                 elsif coins < 100 && coins + coin_value >= 100
                   [2, 100]
                 elsif coins < 1000 && coins + coin_value >= 1000
                   [3, 1000]
                 elsif coins < 10_000 && coins + coin_value >= 10_000
                   [4, 10_000]
                 elsif coins < 100_000 && coins + coin_value >= 100_000
                   [5, 100_000]
                 else
                   0
                 end
    return if trophy_lvl == 0
    user.trophys << Trophy.new(user_id: user.id, level: trophy_lvl[0],
                               trophy: "#{trophy_lvl[1]} Coins collected")
    [trophy_lvl[0], user.trophys.last.trophy]
  end

  def update_user_coins
    user.update(coins: user.coins + value)
    user.coins + value
  end
end
