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

    describe '#can_build?' do 
      before :each do
        supplies_1 = {fabric: 5, scissors: 2}
        supplies_2 = {fabric: 6, scissors: 0}

        @person_1 = Person.new({name: 'Hector', interests: ['sewing', 'drawing']})
        @person_2 = Person.new({name: 'Lana', interests: ['sewing', 'drawing']})

        allow(@person_1).to receive(:supplies).and_return(supplies_1)
        allow(@person_2).to receive(:supplies).and_return(supplies_2)

        @craft_1 = instance_double('Craft', supplies_required: {fabric: 5, scissors: 1})
      end

      it 'returns true if the person has enough supplies required' do
        actual_result = @person_1.can_build?(@craft_1)
        expect(actual_result).to eq true
      end
      
      it 'returns false if the person does not have enough supplies' do
        actual_result = @person_2.can_build?(@craft_1)
        expect(actual_result).to eq false
      end
    end
  end
end
