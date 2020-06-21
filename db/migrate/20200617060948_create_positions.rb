class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.string :display_name, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
