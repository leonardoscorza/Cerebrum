load 'arm/memory.rb'

$know = {}


class Hippocampus
	@@memory     = Memory.new('brainMemory')


	def temp
		#Inserção manual dos conhecimentos 
		conhecimento = {:know => 'teste', :methodNumber => 2, :methods => { :method1 => {:name => 'writeTwiter' , :paramNumber => 1 , :param => 'message'} , :method2 => {:name => 'readTwiter' , :paramNumber => 1 , :param => 'urlTwitter'} }}
		@@memory.burn("know", conhecimento)
		p 	@@memory.remember('know', :know => 'teste')
	end


end