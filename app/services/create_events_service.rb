class CreateEventsService
  def initialize(events)
    @events = events
  end

  def call
    return [] if @events.empty?
    persist
  end
  
  private

  def persist
    @events.each do |e|
      Event.transaction do
        league = League.find_or_build_by({ name: e['league_name'] })
        home = Team.find_or_build_by({ name: e['match_hometeam_name'] })
        away = Team.find_or_build_by({ name: e['match_awayteam_name'] })
        Match.find_or_build_by({
          id: e['match_id'],
          status: e['match_status'],
          started_at: combine_datetime(e['match_date'], e['match_time']),
          hometeam_score: e['match_hometeam_score'],
          awayteam_score: e['match_awayteam_score'],
          hometeam_id: home.id,
          awayteam_id: away.id,
          league_id: league.id
        })
      end
    end
  end

  def combine_datetime(date, time)
    d = Date.strptime(date, "%Y-%d-%m")
    t = Time.parse(time).seconds_since_midnight.seconds
    (d + t).to_datetime
  end

end
