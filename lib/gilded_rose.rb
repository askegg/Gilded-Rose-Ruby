require "zeitwerk"
loader = Zeitwerk::Loader.for_gem(warn_on_extra_files: false)
loader.setup

require "yaml"
ITEM_TYPES = YAML.load_file("config/items.yml")

module GildedRose
  def self.new(name:, days_remaining:, quality:)
    klass_name = ITEM_TYPES["SPECIALISED_CLASSES"][name] || ITEM_TYPES["DEFAULT_CLASS"]
    Kernel.const_get(klass_name).new(days_remaining: days_remaining, quality: quality)
  end
end
