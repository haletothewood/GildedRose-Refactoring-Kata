describe GildedRose do
    
  describe '#update_quality' do
    it 'does not change the quality if quality is 0' do
      items = [Item.new('Item', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end

    it 'reduces quality by 1 if more than 0' do
      items = [Item.new('foo', 0, 1)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end

    it 'reduces sell in value by 1' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq -1
    end
  end
end
