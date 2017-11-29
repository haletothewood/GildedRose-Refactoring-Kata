require 'conjured'

describe Conjured do

  context '#update' do
    let(:conjured) { described_class.new('Conjured', 20, 50) }
    before :each do
      conjured.update
    end
    it 'reduces sell in value by 1' do
      expect(conjured.sell_in).to eq 19
    end

    it 'reduces the quality by 2 if sell in value is more than 0' do
      expect(conjured.quality).to eq 48
    end

    it 'reduces quality by 4 when sell in value is less or equal to 0' do
      19.times { conjured.update }
      expect(conjured.quality).to eq 8
    end
  end
end