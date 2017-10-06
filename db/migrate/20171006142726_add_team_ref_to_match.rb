class AddTeamRefToMatch < ActiveRecord::Migration[5.1]
  def change
    add_column :matches, :hometeam_id, :integer
    add_column :matches, :awayteam_id, :integer
    add_foreign_key :matches, :teams, column: :hometeam_id
    add_foreign_key :matches, :teams, column: :awayteam_id
    # add_reference :matches, :team, foreign_key: true
  end
end
