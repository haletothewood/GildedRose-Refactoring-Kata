class GildedRose
  attr_reader :items

  NAMED_ITEMS = [
    'Aged Brie',
    'Backstage passes to a TAFKAL80ETC concert',
    'Sulfuras, Hand of Ragnaros',
    'Conjured'
  ]
  MAX_QUALITY = 50

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      case item.name
        when NAMED_ITEMS[0]
          return brie_update(item)
        when NAMED_ITEMS[1]
          return backstage_update(item)
        when NAMED_ITEMS[2]
          return sulfuras_update(item)
        when NAMED_ITEMS[3]
          return conjured_update(item)
        else
          return normal_update(item)
      end
    end
  end

  private

  def normal_update(item)
    reduce_sell_in(item)
    return unless quality?(item)
    item.quality -= 1
    item.quality -= 1 if perished?(item)
  end

  def brie_update(item)
    reduce_sell_in(item)
    return if item.quality >= MAX_QUALITY
    item.quality += 1
    item.quality += 1 if perished?(item)
  end

  def backstage_update(item)
    reduce_sell_in(item)
    item.quality += 1
    item.quality += 1 if within_ten_days(item)
    item.quality += 2 if within_five_days(item)
    item.quality = 0 if perished?(item)
  end

  def sulfuras_update(item)
  end

  def conjured_update(item)
    reduce_sell_in(item)
    return unless quality?(item)
    item.quality -= 2
    item.quality -= 2 if perished?(item)
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

  def within_ten_days(item)
    item.sell_in <= 10 && item.sell_in > 5
  end

  def within_five_days(item)
    item.sell_in <= 5 && !perished?(item)
  end
end
