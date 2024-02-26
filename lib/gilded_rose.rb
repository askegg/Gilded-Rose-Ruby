require "zeitwerk"
loader = Zeitwerk::Loader.for_gem(warn_on_extra_files: false)
loader.setup

require "yaml"
ITEM_TYPES = YAML.load_file("config/items.yml")

module GildedRose
  def self.new(options = {})
    klass_name = ITEM_TYPES["ITEMS"][options[:name]] || ITEM_TYPES["DEFAULT"]
    Kernel.const_get(klass_name)
      .new(days_remaining: options[:days_remaining],
        quality: options[:quality])
  end
end
