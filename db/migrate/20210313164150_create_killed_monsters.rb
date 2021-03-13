class CreateKilledMonsters < ActiveRecord::Migration[6.1]
  def change
    create_table :killed_monsters do |t|
      t.references :user
      t.references :monster
      t.timestamps
    end
  end
end
