require 'pageboy/page_turner/base'

module Pageboy
  module PageTurner
    class Array < Base

      def page(page_id, opts={})
        with_merged_options(opts) do |o|
          per_page = Integer(o[:per_page])
          i = Integer(page_id)
          max_page = (resource.size.to_f / per_page).ceil
          prev_page_id = i - 1 < 1 ? nil : i - 1
          next_page_id = i + 1 > max_page ? nil : i + 1

          first_item_index = (i-1) * per_page
          last_item_index = i * per_page - 1
          slice = resource[first_item_index..last_item_index]
          Page.new(self, slice, prev_page_id, next_page_id)
        end
      end

    end
  end
end
