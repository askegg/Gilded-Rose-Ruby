require "zeitwerk"
loader = Zeitwerk::Loader.new
loader.push_dir(File.dirname(__FILE__))
loader.setup

require "yaml"
app_root = File.expand_path("../", __dir__)
ITEM_TYPES = YAML.load_file(File.new("#{app_root}/config/items.yml")).freeze

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
