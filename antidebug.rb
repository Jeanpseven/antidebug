require 'win32ole' rescue nil
require 'net/http'
require 'json'
require 'uri'

# Função fictícia de descriptografia
def v_decrypt(str)
  # Lógica de descriptografia aqui, se necessário
  str
end

begin
  # Início
  url = URI('http://pastebin.com/raw/xxxxxx')
  response = Net::HTTP.get(url)

  # Substitui &quot; por aspas
  response.gsub!('&quot;', '"')

  # Extrai texto entre "start" e "end"
  start_index = response.index('start') + 'start'.length
  end_index = response.index('end')
  extracted = response[start_index...end_index].strip

  # Converte para JSON
  json = JSON.parse(extracted)
  address = v_decrypt(json['host']).strip

  puts "Endereço: #{address}"
rescue => e
  puts "Erro: #{e.message}"
end
