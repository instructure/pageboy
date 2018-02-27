require_relative '../lib/pageboy'

describe Pageboy do
  context "for an array" do
    let(:array) { %w(this is an array with words in it) }
    let(:turner) { Pageboy::PageTurner::Array.new(array, :per_page => 3) }

    it "paginates an array" do
      expect(turner.first.prev).to be_nil
      expect(turner.first.to_a).to eq(%w(this is an))
      expect(turner.first.next.to_a).to eq(%w(array with words))
      expect(turner.first.next.next.to_a).to eq(%w(in it))
      expect(turner.first.next.next.next).to be_nil
    end

    it "can turn to any page" do
      expect(turner.page(2).to_a).to eq(%w(array with words))
    end
  end

  context "matching for page turners" do
    it "chooses PageTurner::Array for arrays" do
      turner = Pageboy.paginate([])
      expect(turner).to be_a(Pageboy::PageTurner::Array)
    end
  end
end