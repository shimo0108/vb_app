class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.integer :gender, null: false, default: 0
      t.text :comment
      t.references :user, foreign_key: true
      t.integer :available_day, null: false, default: 0
      t.integer :prefecture, null: false, default: 0

      t.timestamps
    end
  end
end
