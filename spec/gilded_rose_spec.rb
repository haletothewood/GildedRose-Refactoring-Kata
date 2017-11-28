describe GildedRose do
    
  describe '#update_quality' do
    it 'does not change the quality if quality is 0' do
      items = [Item.new('Item', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end

    it 'reduces quality by 1 if more than 0' do
      items = [Item.new('foo', 10, 1)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end

    it 'reduces sell in value by 1' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq -1
    end

    it 'reduces the quality by 2 when sell in is 0 or less' do
      items = [Item.new('bar', 0, 20)]
      GildedRose.new(items).update_quality
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq -2
      expect(items[0].quality).to eq 16
    end
  end

  context 'Aged Brie' do
    it 'reduces sell in value by 1' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq -1
    end

    it 'increases the quality by 1 if sell in value is more than 0' do
      items = [Item.new('Aged Brie', 10, 1)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 2
    end

    it 'increases the the quality by 2 if sell in value is 0 or less' do
      items = [Item.new('Aged Brie', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 2
    end

    it 'quality has a max value of 50' do
      items = [Item.new('Aged Brie', 0, 50)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 50
    end
  end

  context 'Sulfuras, Hand of Ragnaros' do
    it 'reduces sell in value by 1' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq -1
    end

    it 'doesn\'t change quality' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 10, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 10
    end

    it 'doesn\'t change sell in value' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 15, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 15
    end
  end

  context 'Backstage passes to a TAFKAL80ETC concert' do
    it 'reduces sell in value by 1' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq -1
    end

    it 'increases quality by 2 when sell in value is less or equal to 10 and more than 5' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 7, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 12
    end

    it 'increases quality by 3 when sell in value is less or equal to 5 days and more than 0' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 2, 10)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 13
    end

    it 'sets the quality to 0 if sell in value is 0' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 8)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end
  end

  context 'Conjured' do
    it 'reduces sell in value by 1' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq -1
    end

    it 'reduces quality by 2 if sell in value is more than 0' do
      items = [Item.new('Conjured', 10, 8)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 6
    end
  end
end
