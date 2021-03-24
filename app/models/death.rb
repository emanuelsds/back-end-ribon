class Death < ApplicationRecord
  belongs_to :user

  after_create :create_trophy

  private
  def create_trophy
    trophy_lvl = case user.deaths.where(user_id: user.id).size
                 when  1
                   [1, 1] 
                 when  10
                   [2, 10]
                 when  25
                   [3, 25]
                 when  50
                   [4, 50]
                 when  100
                   [5, 100]
                 else
                   0
                 end
    return if trophy_lvl == 0
    user.trophys << Trophy.new(user_id: user.id, level: trophy_lvl[0],
                               trophy: "#{trophy_lvl[1]} Deaths")
    [trophy_lvl[0], user.trophys.last.trophy]
  end
end