require "zeitwerk"
loader = Zeitwerk::Loader.for_gem(warn_on_extra_files: false)
loader.setup

require "yaml"
ITEM_TYPES = YAML.load_file("config/items.yml").freeze

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
