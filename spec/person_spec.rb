require 'rspec'
require './lib/person'

RSpec.describe Person do
  describe 'instance' do
    before :each do
      @person = Person.new({name: 'Name', interests: ['sewing', 'drawing']})
    end

    it 'exists' do
      expect(@person).to be_a Person
    end

    it 'has a name' do
      expect(@person.name).to eq 'Name'
    end

    it 'has interests' do
      expect(@person.interests).to eq ['sewing', 'drawing']
    end

    it 'has supplies' do
      expect(@person.supplies).to eq({})
    end
  end

  describe 'method,' do
    describe '#add_supply' do
      it 'adds supplies to the person' do
        person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
        expected_supplies = {fabric: 4}
        
        person.add_supply(:fabric, 4)

        expect(person.supplies).to eq expected_supplies
      end
    end
  end
end
