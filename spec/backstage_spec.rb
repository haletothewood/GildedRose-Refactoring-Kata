require 'backstage'

describe Backstage do

  context '#update' do
    let(:backstage) { described_class.new('Aged_backstage', 20, 20) }
    before :each do
      backstage.update
    end
    it 'reduces sell in value by 1' do
      expect(backstage.sell_in).to eq 19
    end

    it 'increases the quality by 1 if sell in value is more than 10' do
      expect(backstage.quality).to eq 21
    end

    it 'increases quality by 2 when sell in value is less or equal to 10 and more than 5' do
      9.times { backstage.update }
      expect(backstage.quality).to eq 31
    end

    it 'increases quality by 3 when sell in value is less or equal to 5 days and more than 0' do
      expect(backstage.quality).to eq 21
    end

    it 'sets the quality to 0 if sell in value is 0' do
      19.times { backstage.update }
      expect(backstage.quality).to eq 0
    end
  end
end
