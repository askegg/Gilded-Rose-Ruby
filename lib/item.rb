class Item
  attr_reader :days_remaining, :quality

  def initialize(options = {})
    @days_remaining = options[:days_remaining] || 0
    @quality = options[:quality] || 0
  end

  def tick
  end
end
