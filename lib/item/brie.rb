class Item::Brie
  attr_reader :days_remaining, :quality

  def initialize(days_remaining:, quality:)
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    @days_remaining -= 1
    @quality += 1
    @quality += 1 if @days_remaining <= 0

    @quality = @quality.clamp(0, 50)
  end
end
