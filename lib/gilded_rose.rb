module GildedRose
  def self.new(**args)
    klass_name = ITEM_TYPES["ITEMS"][args[:name]] || ITEM_TYPES["DEFAULT"]

    Kernel.const_get(klass_name)
      .new(
        days_remaining: args[:days_remaining],
        quality: args[:quality]
      )
  end
end
