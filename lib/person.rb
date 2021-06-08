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
end