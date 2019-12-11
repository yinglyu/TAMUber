require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  before(:all) do
    @event_1 = Event.create(title: 'Sean Chen', start: '2019-12-11 07:00:00', end: '2019-12-11 10:30:00',
                            created_at: '2019-12-11 01:31:41.917235', updated_at: '2019-12-11 01:31:41.917235',
                            frequency: 'weekly', driver_id: 6)
  end
end