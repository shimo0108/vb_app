class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.string :prefecture, null: false
      t.string :schedule, null: false
      t.string :position, null: false
      t.column :gender, :integer, default: 0
      

      t.timestamps
    end
    
  end
end
