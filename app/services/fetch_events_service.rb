class FetchEventsService

  def initialize
    @url = ENV['FOOTBALL_EVENTS_API'].to_s
  end

  def call
    # validate    
    parse
  end

  private

  def parse
    response = HTTParty.get(@url)
    result = JSON.parse(response.body)
    return [] if result.empty?
    result
  end

end
