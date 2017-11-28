require 'item'

describe Item do

  name = 'Foo'
  sell_in = 20
  quality = 10
  let(:item) { Item.new(name, sell_in, quality) }
  it 'is created with a name' do
    expect(item.name).to eq 'Foo'
  end

  it 'is created with a value for the number of days to sell within' do
    expect(item.sell_in).to eq 20
  end
end
