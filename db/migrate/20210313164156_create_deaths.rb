class CreateDeaths < ActiveRecord::Migration[6.1]
  def change
    create_table :deaths do |t|
      t.references :user, null: false, index:true, foreign_key: true
      t.timestamps
    end
  end
end
