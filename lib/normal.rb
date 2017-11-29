class Normal < Item
  attr_reader :name, :sell_in, :quality

  SELL_BY_DATE = 0
  MINIMUM_QUALITY = 0

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update
    @sell_in -= 1
    return unless quality? 
    @quality -= 1
    @quality -= 1 if perished? && quality?
  end

  private

  def perished?
    @sell_in <= SELL_BY_DATE
  end

  def quality?
    @quality > MINIMUM_QUALITY
  end
end
