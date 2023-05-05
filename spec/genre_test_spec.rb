require_relative '../genre'

describe Genre do
  let(:item) { double("item") }
  subject(:genre) { described_class.new(1, "Horror") }

  describe "#add_item" do
    context "when item is an instance of Item" do
      it "adds the item to the items array" do
        genre.add_item(item)
        expect(genre.items).to include(item)
      end

      it "sets the genre attribute of the item" do
        genre.add_item(item)
        expect(item.genre).to eq(genre)
      end
    end

    context "when item is not an instance of Item" do
      it "does not add the item to the items array" do
        genre.add_item("not an item")
        expect(genre.items).to_not include("not an item")
      end
    end
  end
end 