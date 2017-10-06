class SyncEventsApiJob < ApplicationJob
  queue_as :default

  def perform(*args)
    events = CompareEventsService.new(FetchEventsService.new.call).call
    CreateEventsService.new(events).call
  end
end
