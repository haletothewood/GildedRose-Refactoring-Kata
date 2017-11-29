require 'brie'

describe Brie do

  context '#update' do
    let(:brie) { described_class.new('Aged_Brie', 10, 20) }
    before :each do
      brie.update
    end
    it 'reduces sell in value by 1' do
      expect(brie.sell_in).to eq 9
    end

    it 'increases the quality by 1 if sell in value is more than 0' do
      expect(brie.quality).to eq 21
    end

    it 'increases the the quality by 2 if sell in value is 0 or less' do
      9.times { brie.update }
      expect(brie.quality).to eq 31
    end

    it 'quality has a max value of 50' do
      150.times { brie.update }
      expect(brie.quality).to eq 50
    end
  end
end
