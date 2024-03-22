require "zeitwerk"
loader = Zeitwerk::Loader.new
loader.push_dir(File.dirname(__FILE__))
loader.setup

puts GildedRose.new(name: "Conjured Mana Cake")
