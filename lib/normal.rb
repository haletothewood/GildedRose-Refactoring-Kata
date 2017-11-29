class Normal < Item

  SELL_BY_DATE = 0
  MINIMUM_QUALITY = 0

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
