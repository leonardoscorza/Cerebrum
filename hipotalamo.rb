#This is the first eletron passing



t1 = Thread.new {
  p t1

}
 
t2 = Thread.new{
  p t2

}
 
t1.join()
t2.join()



class Hipotalamo
	def initializations
		#Iniciate console
		consoleT = Thread.new {
 			p 'a'
		}
		consoleT.join()
	end

end




#Inicialize the brain functions
brain = Hipotalamo.new
brain.initializations