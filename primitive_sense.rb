require 'rubygems'

require 'memcache'

class PrimitiveSense
	@@starling = ""

	def initialize
		@@starling = MemCache.new 'localhost:22122'
	end

	def listen(about)
		objeto_fila = @@starling.get(about)
	end

	def speak(about, what)
		@@starling.set(about, what)
	end
end

acessSense = PrimitiveSense.new

acessSense.speak("teste", "testando")

p acessSense.listen("teste")