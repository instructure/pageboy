require 'pageboy/config'
require 'pageboy/collator'
require 'pageboy/page'
require 'pageboy/page_turner/array'
require 'pageboy/page_turner/link_header'

module Pageboy
  def self.paginate(target, opts={})
    Pageboy::Config.turners.each_pair do |klass, matchers|
      matchers.each do |matcher|
        return klass.new(target, opts) if matcher.call(target)
      end
    end
    raise "could not find suitable PageTurner for #{target}"
  end

  def self.register_page_turner(klass, &block)
    Pageboy::Config.turners[klass] ||= []
    Pageboy::Config.turners[klass] << block
  end
end

Pageboy.register_page_turner(Pageboy::PageTurner::Array) do |object|
  object.respond_to?(:[]) && object.respond_to?(:size)
end

Pageboy.register_page_turner(Pageboy::PageTurner::LinkHeader) do |object|
  object.is_a?(String) && object.include?('/api/')
end
