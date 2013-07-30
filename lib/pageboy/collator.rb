module Pageboy
  class Collator
    include Enumerable

    def initialize(page_turner)
      @page_turner = page_turner
    end

    def each(&block)
      page = @page_turner.first
      while page
        page.items.each(&block)
        page = page.next
      end
    end
  end
end

# Pageboy::Collator.new(page_turner).each { |item| }