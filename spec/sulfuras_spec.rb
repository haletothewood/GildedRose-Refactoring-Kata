require 'sulfuras'

describe Sulfuras do

  context '#update' do
    let(:sulfuras) { described_class.new('Aged_Sulfuras', 20, 20) }
    before :each do
      sulfuras.update
    end
    it 'doesn\'t change quality' do
      expect(sulfuras.sell_in).to eq 20
    end

    it 'doesn\'t change sell in value' do
      expect(sulfuras.quality).to eq 20
    end
  end
end
