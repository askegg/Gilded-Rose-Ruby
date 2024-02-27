class Item
  attr_reader :days_remaining, :quality

  def initialize(**args)
    defaults = {days_remaining: 0, quality: 0}
    args.compact! # Remove nils
    options = defaults.merge(args)

    @days_remaining = options[:days_remaining]
    @quality = options[:quality]
  end

  def tick
  end
end
