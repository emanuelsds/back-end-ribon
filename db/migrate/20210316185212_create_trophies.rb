class CreateTrophies < ActiveRecord::Migration[6.1]
  def change
    create_table :trophies do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :level
      t.string :trophy
      t.timestamps
    end
  end
end
