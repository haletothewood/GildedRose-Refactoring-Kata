class Conjured < Normal
  
  def update
    @sell_in -= 1
    return unless quality?
    @quality -= 2
    @quality -= 2 if perished? && quality?
  end
end
