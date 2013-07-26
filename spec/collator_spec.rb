require 'pageboy/page_turner/array'
require 'pageboy/collator'

describe Pageboy::Collator do
  let(:array) { %w(some words to paginate) }
  let(:page_turner) { Pageboy::PageTurner::Array.new(array, :per_page => 3) }
  let(:collator) { Pageboy::Collator.new(page_turner) }

  it "collates" do
    items = []
    collator.each do |item|
      items << item
    end
    items.should == ["some", "words", "to", "paginate"]
  end
end