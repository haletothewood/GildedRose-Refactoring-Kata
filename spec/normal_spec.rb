
require 'normal'

describe Normal do

  let(:normal) { described_class.new('Normal', 10, 20) }

  context '#update' do
    it 'reduces the sell in value by one' do
      expect { normal.update }.to change { normal.sell_in }.by(-1)
    end
  end
end
