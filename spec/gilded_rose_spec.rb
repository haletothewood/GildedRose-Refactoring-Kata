require_relative '../lib/gilded_rose.rb'

describe GildedRose do

  let(:item) { double :item, name: 'foo', sell_in: 0, quality: 0 }

  describe '#update_quality' do
    it 'does not change the name' do
      items = [item]
      allow(item).to receive(:quality=).with(1)
      allow(item).to receive(:sell_in=).with(-1)
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq 'foo'
    end
  end
end
