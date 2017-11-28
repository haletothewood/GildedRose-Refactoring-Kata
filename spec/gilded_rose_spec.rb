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

    it "reduces the quality by 2 when sell in is 0 or less" do
      items = [Item.new("bar", 0, 20)]
      GildedRose.new(items).update_quality
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq -2
      expect(items[0].quality).to eq 16
    end
  end
end
