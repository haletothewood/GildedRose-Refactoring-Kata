class GildedRose
  attr_reader :items

  NAMED_ITEMS = [
    'Aged Brie',
    'Backstage passes to a TAFKAL80ETC concert',
    'Sulfuras, Hand of Ragnaros',
    'Conjured'
  ]
  MAXIMUM_QUALITY = 50
  MINIMUM_QUALITY = 0
  SELL_BY_DATE = 0
  ONE_DAY = 1
  TEN_DAYS = 10
  FIVE_DAYS = 5

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
    return if item.quality >= MAXIMUM_QUALITY
    item.quality += 1
    item.quality += 1 if perished?(item)
  end

  def backstage_update(item)
    reduce_sell_in(item)
    item.quality += 1
    item.quality += 1 if within_ten_days(item)
    item.quality += 2 if within_five_days(item)
    item.quality = MINIMUM_QUALITY if perished?(item)
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
    item.sell_in -= ONE_DAY
  end

  def perished?(item)
    item.sell_in <= SELL_BY_DATE
  end

  def quality?(item)
    item.quality > MINIMUM_QUALITY
  end

  def within_ten_days(item)
    item.sell_in <= TEN_DAYS && item.sell_in > FIVE_DAYS
  end

  def within_five_days(item)
    item.sell_in <= FIVE_DAYS && !perished?(item)
  end
end
