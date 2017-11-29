class GildedRose
  attr_reader :items

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
      item.update
    end
  end
end
