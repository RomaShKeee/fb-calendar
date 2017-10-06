class CompareEventsService
  def initialize(events)
    @events = events
  end

  def call
    return [] if @events.empty?
    compare(get_ids)
  end
  
  private

  def get_ids
    events = @events.map { |e| e['match_id'] }
    Match.where(id: events)&.map(&:id)
  end

  def compare(ids)
    return @events if ids.empty?
    @events.delete_if do |event|
      ids.include?(event['match_id'].to_i)
    end
  end

end
