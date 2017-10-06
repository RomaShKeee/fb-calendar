class AddLeagueRefToMatch < ActiveRecord::Migration[5.1]
  def change
    add_reference :matches, :league, foreign_key: true
  end
end
