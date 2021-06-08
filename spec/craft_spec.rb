require 'rspec'
require './lib/craft'

RSpec.describe Craft do
  describe 'instance' do
    before :each do
      @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
    end

    it 'exists' do
      expect(@craft).to be_a Craft
    end

    it 'has required supplies' do
      expect(@craft.supplies_required).to eq ({yarn: 20, scissors: 1, knitting_needles: 2})
    end
  end
  
  describe 'method,' do

  end
end