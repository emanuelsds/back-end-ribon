class KilledMonster < ApplicationRecord
  belongs_to :user
  belongs_to :monster

  after_create :check_trophy

  private

  def check_trophy
    user_trophys = user.trophys
    trophy_lvl = case user.killed_monsters.where(monster_id: monster.id).size
                 when  1
                   0
                 when  100
                   1
                 when  1000
                   2
                 when  10_000
                   3
                 when  100_000
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
                               trophy: "1#{'0' * trophy_value} #{monster.name} killed")
  end
end
