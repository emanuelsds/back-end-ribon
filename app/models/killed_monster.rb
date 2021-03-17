class KilledMonster < ApplicationRecord
  belongs_to :user
  belongs_to :monster

  after_create :check_trophy

  private

  def check_trophy
    case user.killed_monsters.where(monster_id: monster.id).size
    when  1
      user.trophys << Trophy.new(user_id: user.id, level: 1, trophy: "#{monster.name}s killed")
    when  100
      user.trophys << Trophy.new(user_id: user.id, level: 2, trophy: "#{monster.name}s killed")
    when  1000
      user.trophys << Trophy.new(user_id: user.id, level: 3, trophy: "#{monster.name}s killed")
    when  10000
      user.trophys << Trophy.new(user_id: user.id, level: 4, trophy: "#{monster.name}s killed")
    when  100000
      user.trophys << Trophy.new(user_id: user.id, level: 5, trophy: "#{monster.name}s killed")
    end
  end
end
