describe GildedRose do
    
  describe "#update_quality" do
    it "does not change the quality if quality is 0" do
      items = [Item.new("Item", 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end
  end
end
