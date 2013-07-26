require 'pageboy/page'
require 'pageboy/config'

module Pageboy
  module PageTurner
    class Base
      attr_accessor :resource

      def initialize(resource, opts={})
        @resource = resource
        @opts = opts
      end

      # Can be overridden in subclasses
      def first_page_id
        # Some PageTurners use integers, others use GUIDs etc., 
        # but page numbers are most common, so default to 1.
        1
      end

      # Should return a Pageboy::Page object
      def page(page_id, opts={})
        raise NotImplementedError,
              "'page' should be implemented in subclasses"
      end

      def first(opts={})
        page(first_page_id, opts)
      end

      def with_merged_options(opts={})
        yield Pageboy::Config.config.merge(@opts).merge(opts)
      end
    end
  end
end