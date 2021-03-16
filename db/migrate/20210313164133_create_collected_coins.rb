class CreateCollectedCoins < ActiveRecord::Migration[6.1]
  def change
    create_table :collected_coins do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :value
    end
  end
end
