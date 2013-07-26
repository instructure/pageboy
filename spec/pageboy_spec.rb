require_relative '../lib/pageboy'

describe Pageboy do
  context "for an array" do
    let(:array) { %w(this is an array with words in it) }
    let(:turner) { Pageboy::PageTurner::Array.new(array, :per_page => 3) }

    it "paginates an array" do
      turner.first.prev.should be_nil
      turner.first.to_a.should == %w(this is an)
      turner.first.next.to_a.should == %w(array with words)
      turner.first.next.next.to_a.should == %w(in it)
      turner.first.next.next.next.should be_nil
    end

    it "can turn to any page" do
      turner.page(2).to_a.should == %w(array with words)
    end
  end

  context "matching for page turners" do
    it "chooses PageTurner::Array for arrays" do
      turner = Pageboy.paginate([])
      turner.should be_a(Pageboy::PageTurner::Array)
    end
  end
end