class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :team
      t.string :position
      t.string :player_ref
      t.string :team_ref

      t.timestamps
    end
  end
end
