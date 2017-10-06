require "rails_helper"

describe 'Fetch Events' do
  it 'should fetch all events from exteranl API' do
    events = FetchEventsService.new
    result = events.call
    expect(result).to be_a(Array)
    expect(result.count).to be > 0
  end
end
