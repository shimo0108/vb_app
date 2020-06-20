class CreatePlayerPositions < ActiveRecord::Migration[5.2]
  def change
    create_table :player_positions do |t|
      t.references :player, foreign_key: true
      t.references :position, foreign_key: true

      t.timestamps
    end
  end
end
