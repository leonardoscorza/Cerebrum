p 'The magic begin now'

# Initialize


# Call the configurations
# require 'configurations.rb'
# Load initializers

Dir[__dir__ + "/initializer/*.rb"].each {|file| require file }
