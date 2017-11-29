require 'normal'

describe Normal do

  context '#update' do
    let(:normal) { described_class.new('Normal', 10, 20) }
    before :each do
      normal.update
    end
    it 'reduces the sell in value by one' do
      expect(normal.sell_in).to eq 9
    end

    it 'does not change the quality if quality is 0' do
      50.times { normal.update }
      expect(normal.quality).to eq 0
    end

    it 'reduces quality by 1 if more than 0' do
      expect(normal.quality).to eq 19
    end

    it 'reduces the quality by 2 when sell in is 0 or less' do
      10.times { normal.update }
      expect { normal.update }.to change { normal.quality }.by(-2)
    end
  end
end
