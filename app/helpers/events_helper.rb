module EventsHelper
  def match_name(match)
    "#{match.hometeam.name} #{match.hometeam_score}:#{match.awayteam_score} #{match.awayteam.name}"
  end
end
