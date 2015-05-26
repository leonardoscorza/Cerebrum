require 'yaml'
require 'json'
require 'rest-client'

class BaseModel
  @@know = {}

  def initialize dir
    @dir = dir
    self.actions_array dir
  end

  def actions_array dir
    begin
      configurations = YAML::load_file(File.join(@dir, 'config.yml'))
      action_name = configurations['configurations']['action_name']
    rescue
      action_name = self.class.name.downcase
    end
    @@know[action_name] = self
  end

  def self.action_obj name
    @@know[name]
  end

  def self.action_name name
    begin
      configurations = YAML::load_file(File.join(@dir, 'config.yml'))
      configurations['configurations']['action_name']
    rescue
      p 'fail'
      self.class.name.downcase
    end
  end

  def help client=nil
    begin
      configurations = YAML::load_file(File.join(@dir, 'config.yml'))
      message = configurations['configurations']['help_message']
    rescue Exception => e
      message = 'The configuration file are corrupted or dont exist'
    end
    $acessSense.speak('console',message)
    true
  end

end

