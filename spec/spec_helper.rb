require './base_model.rb'

Dir["./actions/fundamental/*/*_spec.rb"].each {|file| require file }
Dir["./actions/extensions/*/*_spec.rb"].each {|file| require file }
