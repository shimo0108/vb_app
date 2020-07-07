class CreateTeamPositions < ActiveRecord::Migration[5.2]
  def change
    create_table :team_positions do |t|
      t.references :team, foreign_key: true
      t.references :position, foreign_key: true

      t.timestamps
    end
  end
end
