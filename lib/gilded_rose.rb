require 'zeitwerk'
loader = Zeitwerk::Loader.for_gem(warn_on_extra_files: false)
loader.setup

class GildedRose
  attr_reader :name, :days_remaining, :quality

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    if @name == "Normal Item"
      @item = Item::Normal.new(days_remaining: days_remaining, quality: quality)
      @item.tick
    end

    if @name == "Aged Brie"
      @item = Item::Brie.new(days_remaining: days_remaining, quality: quality)
      @item.tick
    end

    if @name == "Sulfuras, Hand of Ragnaros"
      @item = Item::Sulfuras.new(days_remaining: days_remaining, quality: quality)
      @item.tick
    end

    if @name == "Backstage passes to a TAFKAL80ETC concert"
      @item = Item::Backstage.new(days_remaining: days_remaining, quality: quality)
      @item.tick
    end

    if @name == "Conjured Mana Cake"
      @item = Item::Conjured.new(days_remaining: days_remaining, quality: quality)
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
