require "rails_helper"

describe 'Create Events' do
  it 'should save non existing events' do
    events = CompareEventsService.new(FetchEventsService.new.call).call
    result = CreateEventsService.new(events).call
    expect(result).to be_a(Array)
    expect(result.count).to be > 0
  end
end
