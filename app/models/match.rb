class Match < ApplicationRecord
  belongs_to :league
  belongs_to :hometeam, class_name: "Team", foreign_key: "hometeam_id"
  belongs_to :awayteam, class_name: "Team", foreign_key: "awayteam_id"
end
