class Item
  attr_reader :days_remaining, :quality

  def initialize(days_remaining:, quality:)
    @days_remaining = days_remaining
    @quality = quality
  end
end
