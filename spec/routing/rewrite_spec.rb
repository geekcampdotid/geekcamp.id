require 'rails_helper'
require 'rack/rewrite/yaml_rule_set'

describe "rack-rewrite" do

  let(:rules_file) { Rails.root.join('config', 'rewrite.yml') }

  before do
    @app = Class.new { def call(app); true; end }.new
    @rack = Rack::Rewrite.new(@app,
                              :klass => Rack::Rewrite::YamlRuleSet,
                              :options => { :file_name => rules_file })
  end

  def request path, options = {}
    {
      "SERVER_PROTOCOL" => "HTTP/1.1",
      "REQUEST_METHOD" => "GET",
      "REQUEST_PATH" => path,
      "REQUEST_URI" => path,
      "HTTP_VERSION" => "HTTP/1.1",
      "HTTP_HOST" => "www.geekcamp.id",
      "HTTP_CONNECTION" => "keep-alive",
      "HTTP_UPGRADE_INSECURE_REQUESTS" => "1",
      "HTTP_USER_AGENT" => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.84 Safari/537.36",
      "HTTP_ACCEPT" => "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
      "HTTP_ACCEPT_ENCODING" => "gzip, deflate, sdch",
      "HTTP_ACCEPT_LANGUAGE" => "en-US,en;q=0.8,id;q=0.6,nl;q=0.4",
      "SERVER_NAME" => "www.geekcamp.id",
      "SERVER_PORT" => "",
      "PATH_INFO" => path,
      "REMOTE_ADDR" => "127.0.0.1",
      "rack.url_scheme" => "https",
      "rack.after_reply" => [],
      "ORIGINAL_FULLPATH" => path,
      "ORIGINAL_SCRIPT_NAME" => ""
    }.merge(options)
  end

  let(:scheme)  { 'http' }
  let(:host)    { 'www.geekcamp.id' }
  let(:port)    { nil }

  def get path
    response = @rack.call request(path, {
      "HTTP_HOST" => "#{host}#{":#{port}" if port}",
      "SERVER_NAME" => host,
      "rack.url_scheme" => scheme
    })
    return response if response == true
    response[1]['Location']
  end

  it "redirects /ticket to BukaLapak" do
    expect(get('/ticket')).to                 eq('https://www.bukalapak.com/p/tiket-voucher/tiket-voucher-lainnya/83qwu2-jual-tiket-geekcamp-15-juli-2017')
    expect(get('/tickets')).to                eq('https://www.bukalapak.com/p/tiket-voucher/tiket-voucher-lainnya/83qwu2-jual-tiket-geekcamp-15-juli-2017')
    expect(get('/ticket?utm_source=bbm')).to  eq('https://www.bukalapak.com/p/tiket-voucher/tiket-voucher-lainnya/83qwu2-jual-tiket-geekcamp-15-juli-2017?utm_source=bbm')
  end

end


