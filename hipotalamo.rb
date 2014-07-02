require 'rubygems'

require 'memcache'

starling = MemCache.new 'localhost:22122'

starling.set 'fila', 'qualquer objeto'





objeto_fila = starling.get 'fila'
if !objeto_fila.nil?
  puts 'recuperado da fila:' + objeto_fila
end

objeto_fila = starling.get 'fila'
if !objeto_fila.nil?
  puts 'recuperado da fila:' + objeto_fila
else
  p 'nao ta aqui nao'
end


