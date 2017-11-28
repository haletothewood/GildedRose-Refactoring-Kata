require 'item'

describe Item do

  let(:item) { Item.new('Foo', 20, 10) }
  it 'is created with a name' do
    expect(item.name).to eq 'Foo'
  end
end
