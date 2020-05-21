class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.text :teamcomment , null: false
      t.string :team_name , null: false
      t.string :teamprefecture, null: false
      t.string :recruitment_position, null:false
      t.string :practice_schedule, null: false
      t.references :user, foreign_key: true


      t.timestamps
    end
    add_index :teams,[:user_id,:created_at],unique: true
  end
end
