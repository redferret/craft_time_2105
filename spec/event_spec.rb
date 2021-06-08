require 'rspec'
require './lib/event'

RSpec.describe Event do
  describe 'instance' do
    before :each do
      @craft = instance_double('Craft')
      @person = instance_double('Person')
      @event = Event.new("Carla's Craft Connection", [@craft], [@person])
    end

    it 'exists' do
      expect(@event).to be_a Event
    end

    it 'has a name' do
      expect(@event.name).to eq "Carla's Craft Connection"
    end

    it 'has crafts' do
      expected_crafts = [@craft]
      expect(@event.crafts).to eq expected_crafts
    end

    it 'has attendees' do
      expected_attendees = [@person]
      expect(@event.attendees).to eq expected_attendees
    end
  end
  
  describe 'method,' do
    
  end
end