require 'rubygems'
require 'bundler/setup'
require 'net/http'
require 'uri'

# Get the IMSI of the target device
imsi = "310123456789012"

# Create a new HTTP request
uri = URI.parse("http://localhost:8080/imsi/#{imsi}")
request = Net::HTTP::Get.new(uri)

# Set the headers
request["Content-Type"] = "application/json"
request["Accept"] = "application/json"

# Send the request
response = Net::HTTP.start(uri.hostname, uri.port) do |http|
 http.request(request)
end

# Print the response
puts response.body
