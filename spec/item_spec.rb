require 'item'

describe Item do

  name = 'Foo'
  sell_in = 20
  quality = 10
  let(:item) { Item.new(name, sell_in, quality) }
  describe '#new' do
    it 'is created with a name' do
      expect(item.name).to eq 'Foo'
    end

    it 'is created with a value for the number of days to sell within' do
      expect(item.sell_in).to eq 20
    end

    it 'is created with a value for it\'s quality metric' do
      expect(item.quality).to eq 10
    end
  end

  describe '#to_string' do
    it 'converts the items attributes to a string' do
      expect(item.to_s).to eq "Foo, 20, 10"
    end
  end
end
