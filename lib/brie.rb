class Brie < Normal

  MAXIMUM_QUALITY = 50

  def update
    @sell_in -= 1
    return if @quality >= MAXIMUM_QUALITY
    @quality += 1
    @quality += 1 if perished? && @quality < MAXIMUM_QUALITY
  end
end
