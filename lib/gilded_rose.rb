require "zeitwerk"
loader = Zeitwerk::Loader.for_gem(warn_on_extra_files: false)
loader.setup

class GildedRose
  attr_reader :name

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
    @item = klass_for(@name).new(days_remaining: days_remaining, quality: quality)
  end

  def klass_for(name)
    case name
    when "Normal Item"
      Item::Normal
    when "Aged Brie"
      Item::Brie
    when "Sulfuras, Hand of Ragnaros"
      Item::Sulfuras
    when "Backstage passes to a TAFKAL80ETC concert"
      Item::Backstage
    when "Conjured Mana Cake"
      Item::Conjured
    end
  end

  def tick
    @item.tick
  end

  def quality
    @item.quality
  end

  def days_remaining
    @item.days_remaining
  end
end
