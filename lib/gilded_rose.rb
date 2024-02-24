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
    if @name == "Normal Item"
      @item.tick
    end

    if @name == "Aged Brie"
      @item.tick
    end

    if @name == "Sulfuras, Hand of Ragnaros"
      @item.tick
    end

    if @name == "Backstage passes to a TAFKAL80ETC concert"
      @item.tick
    end

    if @name == "Conjured Mana Cake"
      @item.tick
    end
  end

  def quality
    return @item.quality if @item
    @quality
  end

  def days_remaining
    return @item.days_remaining if @item
    @days_remaining
  end
end
