require_relative 'lib/parser'
require 'net/http'
require 'rexml/document'

URL = 'http://www.cbr.ru/scripts/XML_daily.asp'.freeze

response = Net::HTTP.get_response(URI.parse(URL))
doc = REXML::Document.new(response.body)

# Достаем все XML-теги <Valute> внутри тега <ValCurs> и преобразуем их в массив
all_nodes = doc.elements['ValCurs'].to_a
valute_nodes = all_nodes[10,2]

puts "Текущие курсы валют \n \n"

valute_nodes.each do |node|
  puts Parser.from_xml(node)
end