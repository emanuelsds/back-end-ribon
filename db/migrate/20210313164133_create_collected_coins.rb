class CreateCollectedCoins < ActiveRecord::Migration[6.1]
  def change
    create_table :collected_coins do |t|
      t.references :user
      t.integer :value
    end
  end
end
