describe GildedRose do
  let(:normal) { double :normal, name: 'Normal' }
  let(:brie) { double :brie, name: 'Aged_Brie' }
  let(:backstage) { double :backstage, name: 'Backstage passes to a TAFKAL80ETC concert' }
  let(:sulfuras) { double :sulfuras, name: 'Sulfuras, Hand of Ragnaros' }
  let(:conjured) { double :conjured, name: 'Conjured' }
  let(:items) { [normal, brie, backstage, sulfuras, conjured] }
  let(:gilded_rose) { described_class.new(items)}

  describe '#update_quality' do
    it 'instructs each item to update it\'s quality' do
      expect(normal).to receive(:update)
      expect(brie).to receive(:update)
      expect(backstage).to receive(:update)
      expect(sulfuras).to receive(:update)
      expect(conjured).to receive(:update)
      gilded_rose.update_quality
    end
  end
end
