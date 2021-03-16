class CreateKilledMonsters < ActiveRecord::Migration[6.1]
  def change
    create_table :killed_monsters do |t|
      t.references :user, null: false, foreign_key: true
      t.references :monster, null: false, foreign_key: true
      t.timestamps
    end
  end
end
