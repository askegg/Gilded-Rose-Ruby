class Item
  attr_reader :days_remaining, :quality

  def initialize(options = {})
    @days_remaining = options[:days_remaining]
    @quality = options[:quality]
  end

  def tick
  end
end
