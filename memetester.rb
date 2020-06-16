require 'telegram/bot'
require 'net/http'
require 'json'

url = 'https://meme-api.herokuapp.com/gimme'
uri = URI(url)
response = Net::HTTP.get(uri)
data1 = JSON.parse(response)
stringurl = data1['url']
print stringurl
