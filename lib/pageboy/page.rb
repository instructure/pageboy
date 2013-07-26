module Pageboy
  class Page
    attr_reader :items

    def initialize(turner, items, prev_page_id, next_page_id)
      @turner = turner
      @items = items
      @prev_page_id = prev_page_id
      @next_page_id = next_page_id
    end

    def prev
      @turner.page(@prev_page_id) if @prev_page_id
    end

    def next
      @turner.page(@next_page_id) if @next_page_id
    end

    def to_a
      @items
    end

    def each(&block)
      @items.each(&block)
    end
  end
end