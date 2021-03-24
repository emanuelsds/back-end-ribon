class KilledMonster < ApplicationRecord
  belongs_to :user
  belongs_to :monster
  after_create :create_trophy
  private

  def create_trophy
    trophy_lvl = case user.killed_monsters.where(monster_id: monster.id).size
                 when  1
                   [1, 1]
                 when  100
                   [2, 100]
                 when  1000
                   [3, 1000]
                 when  10_000
                   [4, 10_000]
                 when  100_000
                   [5, 100_000]
                 else
                   0
                 end
    return if trophy_lvl == 0

    user.trophys << Trophy.new(user_id: user.id, level: trophy_lvl[0],
                               trophy: "#{trophy_lvl[1]} #{monster.name} killed")
    [trophy_lvl[0], user.trophys.last.trophy]
  end
end
