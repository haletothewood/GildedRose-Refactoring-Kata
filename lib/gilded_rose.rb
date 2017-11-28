class GildedRose
  attr_reader :items

  NAMED_ITEMS = [
    'Aged Brie',
    'Backstage passes to a TAFKAL80ETC concert',
    'Sulfuras, Hand of Ragnaros',
    'Conjured'
  ]
  
  def initialize(items)
    @items = items
  end

  #next to exit the loop so you can build methods/classes
  def update_quality
    @items.each do |item|
      if !NAMED_ITEMS.include?(item.name)
        return normal_update(item)
      end
      if item.name != 'Aged Brie' and item.name != 'Backstage passes to a TAFKAL80ETC concert'
        if quality?(item)
          if item.name != 'Sulfuras, Hand of Ragnaros'
            if item.name == 'Conjured'
              item.quality = item.quality - 2
            else
              item.quality = item.quality - 1
            end
          end
        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == 'Backstage passes to a TAFKAL80ETC concert'
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end
      if item.name != 'Sulfuras, Hand of Ragnaros'
        reduce_sell_in(item)
      end
      if perished?(item)
        if item.name != 'Aged Brie'
          if item.name != 'Backstage passes to a TAFKAL80ETC concert'
            if item.quality > 0
              if item.name != 'Sulfuras, Hand of Ragnaros'
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
    end
  end

  private

  def normal_update(item)
    if quality?(item)
      unless perished?(item)
        item.quality -= 1
      end
      if perished?(item)
        item.quality -= 2
      end
    end
    reduce_sell_in(item)
  end

  def reduce_sell_in(item)
    item.sell_in -= 1
  end

  def perished?(item)
    item.sell_in <= 0
  end

  def quality?(item)
    item.quality > 0
  end
end
