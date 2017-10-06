require "rails_helper"

describe 'Compare Events' do
  it 'should return non existing events' do
    events = CompareEventsService.new(FetchEventsService.new.call)
    result = events.call
    expect(result).to be_a(Array)
    expect(result.count).to be > 0
  end
end
