class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.string :status, null: false
      t.datetime :started_at
      t.integer :hometeam_score, default: 0
      t.integer :awayteam_score, default: 0
      # r.reference :hometeam
      # r.reference :awayteam
      t.timestamps
    end
  end
end
