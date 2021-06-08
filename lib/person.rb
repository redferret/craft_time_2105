class Person
  attr_reader :name, :interests, :supplies

  def initialize(attrs)
    @name = attrs[:name]
    @interests = attrs[:interests]
    @supplies = Hash.new(0)
  end

  def add_supply(craft_item, quantity)
    @supplies[craft_item] += quantity
  end

  def can_build?(craft)
    keys = craft.supplies_required.keys

    result = keys.map do |key|
      if supplies.has_key?(key)
        supplies[key] >= craft.supplies_required[key]
      end
    end
    
    not(result.include?(false))
  end
end