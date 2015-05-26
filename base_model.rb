#Load commons files
require 'yaml'

class BaseModel

  def help dir, client=nil
    begin
      configurations = YAML::load_file(File.join(dir, 'config.yml'))
      message = configurations['configurations']['help_message']
    rescue Exception => e
      message = 'The configuration file are corrupted or dont exist'
    end
    $acessSense.speak('console',message)
    true
  end
end

#Load fundamentals actions
require './fundamental/memory/memory.rb'
require './fundamental/queue/queue.rb'
require './fundamental/zip/zip.rb'
#Load all actions
Dir["./actions/*/*.rb"].each   {|file| require file }