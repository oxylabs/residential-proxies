require 'uri'
require 'net/http'

uri = URI.parse('https://ip.oxylabs.io/location')
proxy = Net::HTTP::Proxy('pr.oxylabs.io', 7777, 'customer-USERNAME', 'PASSWORD')

req = Net::HTTP::Get.new(uri.path)

result = proxy.start(uri.host,uri.port) do |http|
    http.request(req)
end

puts result.body
