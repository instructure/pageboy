require 'pageboy/page_turner/array'
require 'pageboy/collator'

describe Pageboy::Collator do
  let(:array) { %w(some words to paginate) }
  let(:page_turner) { Pageboy::PageTurner::Array.new(array, :per_page => 3) }
  let(:collator) { Pageboy::Collator.new(page_turner) }

  it "collates with each" do
    items = []
    collator.each do |item|
      items << item
    end
    items.should == %w(some words to paginate)
  end

  it "collates with map" do
    collator.map { |item| item + '.' }.
      should == %w(some. words. to. paginate.)
  end
end