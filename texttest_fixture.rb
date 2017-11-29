#!/usr/bin/ruby -w

require_relative './lib/gilded_rose.rb'
require_relative './lib/item.rb'
require_relative './lib/normal.rb'
require_relative './lib/brie.rb'
require_relative './lib/sulfuras.rb'
require_relative './lib/conjured.rb'
require_relative './lib/backstage.rb'

puts "OMGHAI!"
items = [
  Normal.new("+5 Dexterity Vest", 10, 20),
  Brie.new("Aged Brie", 2, 0),
  Normal.new("Elixir of the Mongoose", 5, 7),
  Sulfuras.new("Sulfuras, Hand of Ragnaros", 0, 80),
  Sulfuras.new("Sulfuras, Hand of Ragnaros", -1, 80),
  Backstage.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
  Backstage.new("Backstage passes to a TAFKAL80ETC concert", 10, 49),
  Backstage.new("Backstage passes to a TAFKAL80ETC concert", 5, 49),
  Conjured.new("Conjured Mana Cake", 3, 6)
]

days = 20
if ARGV.size > 0
  days = ARGV[0].to_i + 1
end

gilded_rose = GildedRose.new(items)
(0...days).each do |day|
  puts "-------- day #{day} --------"
  puts "name, sellIn, quality"
  items.each do |item|
    puts item
  end
  puts ""
  gilded_rose.update_quality
end
