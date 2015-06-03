require "espeak"
include ESpeak


class Text2speech < BaseModel
	def interpreter(params, client)
    	self.help __dir__
  	end

  	def convert text
  		speech = Speech.new(text, voice: "en-us", :speed => 130 ,pitch: 30)
  		speech.save("temp.mp3")
  	end
end
Text2speech.new __dir__
