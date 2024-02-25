require "zeitwerk"
loader = Zeitwerk::Loader.for_gem(warn_on_extra_files: false)
loader.setup

module GildedRose
  def self.new(name:, days_remaining:, quality:)
    klass_name = klass_for(name).to_s
    Kernel.const_get(klass_name).new(days_remaining: days_remaining, quality: quality)
  end

  def self.klass_for(name)
    case name
    when "Aged Brie"
      Item::Brie
    when "Sulfuras, Hand of Ragnaros"
      Item
    when "Backstage passes to a TAFKAL80ETC concert"
      Item::Backstage
    when "Conjured Mana Cake"
      Item::Conjured
    else
    Item::Normal
    end
  end
end
