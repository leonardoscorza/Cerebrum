require 'yaml'
require 'json'
require 'rest-client'

class BaseModel
  @@know = {}

  def initialize dir
    @dir = dir
    self.actions_array dir
  end

  def configurations
    YAML::load_file(File.join(@dir, 'config.yml'))
  end

  def cut_param params, word
    return_word = nil
    params.each do |param|
        if param.class == String and param.include? word
          return_word = param.split(":")[1]
          params.delete(param)
        end
    end
    [params, return_word]
  end

  def actions_array dir
    begin
      action_name = self.configurations['configurations']['action_name']
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
      self.configurations['configurations']['action_name']
    rescue
      self.class.name.downcase
    end
  end

  def help client=nil
    begin
      message = self.configurations['configurations']['help_message']
    rescue Exception => e
      message = 'The configuration file are corrupted or dont exist'
    end
    $acessSense.speak('console',message)
    true
  end

end

