require "zeitwerk"
loader = Zeitwerk::Loader.for_gem(warn_on_extra_files: false)
loader.setup

DEFAULT_CLASS = Item
SPECIALISED_CLASSES = {
  "Normal Item" => Item::Normal,
  "Aged Brie" => Item::Brie,
  "Backstage passes to a TAFKAL80ETC concert" => Item::Backstage,
  "Conjured Mana Cake" => Item::Conjured
}

module GildedRose
  def self.new(name:, days_remaining:, quality:)
    klass_name = (SPECIALISED_CLASSES[name] || DEFAULT_CLASS).to_s
    Kernel.const_get(klass_name).new(days_remaining: days_remaining, quality: quality)
  end
end
