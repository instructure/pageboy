require "link_header"
require "pageboy/page_turner/base"

module Pageboy
  module PageTurner
    class LinkHeader < Base

      def initialize(url, opts={})
        super
        @url = url
        @connection = opts.delete(:connection) or
          fail("LinkHeader page turner requires :connection")
        @first_page_id = url.dup
      end

      def first_page_id
        @first_page_id
      end

      def find_link(header, rel)
        link = ::LinkHeader.parse(header).links.find{ |link| link['rel'] == rel }
        link.to_a.first if link
      end

      def page(url, opts={})
        with_merged_options(opts) do |o|
          response = @connection.get(url)
          header = response.headers[:link]
          # require 'debugger';debugger
          next_page = find_link(header, 'next')
          slice = response.body

          Page.new(self, slice, nil, next_page)
        end
      end

    end
  end
end
