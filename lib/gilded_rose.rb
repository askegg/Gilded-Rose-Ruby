class GildedRose
  attr_reader :name, :days_remaining, :quality

  require "normal_tick"
  require "brie_tick"
  require "sulfuras_tick"
  require "backstage_tick"
  require "conjured_tick"

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    if @name == "Normal Item"
      return normal_tick
    end

    if @name == "Aged Brie"
      return brie_tick
    end

    if @name == "Sulfuras, Hand of Ragnaros"
      return sulfuras_tick
    end

    if @name == "Backstage passes to a TAFKAL80ETC concert"
      return backstage_tick
    end

    if @name == "Conjured Mana Cake"
      return conjured_tick
    end
  end
end
