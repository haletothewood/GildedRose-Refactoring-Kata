class Backstage < Normal

  MINIMUM_QUALITY = 0
  TEN_DAYS = 10
  FIVE_DAYS = 5

  def update
    @sell_in -= 1
    @quality += 1
    @quality += 1 if within_ten_days
    @quality += 2 if within_five_days
    @quality = MINIMUM_QUALITY if perished?
  end

  private

  def within_ten_days
    sell_in <= TEN_DAYS && sell_in > FIVE_DAYS
  end

  def within_five_days
    sell_in <= FIVE_DAYS && !perished?
  end
end
