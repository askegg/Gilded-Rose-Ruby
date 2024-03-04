require "zeitwerk"
loader = Zeitwerk::Loader.new
loader.push_dir(File.dirname(__FILE__))
loader.setup

require "yaml"
app_root = File.expand_path("../", __dir__)
ITEM_TYPES = YAML.load_file(File.new("#{app_root}/config/items.yml")).freeze

puts GildedRose.new
