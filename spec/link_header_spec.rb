require 'webmock/rspec'
require 'faraday'
require 'pageboy/page_turner/link_header'

describe Pageboy do
  context "for an API with link headers" do
    let(:connection) { Faraday.new }
    let(:url) { 'http://canvas.dev/api/v1/thing' }
    let(:link_header) do
      Pageboy::PageTurner::LinkHeader.new(url,
        :connection => connection, :per_page => 3)
    end

    it "paginates a Link header based API" do
      next_link = %{<http://canvas.dev/api/v1/thing?page=2>; rel="next"}

      # First page
      stub_request(:get, "http://canvas.dev/api/v1/thing").
        to_return(
          :status => 200,
          :body => [{"name" => "test1"}],
          :headers => {"Link" => next_link})
      page = link_header.first
      expect(page.items).to eq([{"name" => "test1"}])

      # Second page
      stub_request(:get, "http://canvas.dev/api/v1/thing?page=2").
        to_return(
          :status => 200,
          :body => [{"name" => "test2"}],
          :headers => {})
      page = page.next
      expect(page.items).to eq([{"name" => "test2"}])

      # No more pages
      page = page.next
      expect(page).to be_nil

    end
  end
end