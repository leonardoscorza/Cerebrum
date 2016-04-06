require 'yaml'
require 'json'
require 'rest-client'

class BaseModel
  @@know = {}

  def initialize dir
    @dir = dir
    self.actions_array
  end

  def configurations
    YAML::load_file(File.join(@dir, 'config.yml'))['configurations']
  end

  def cut_param params, word
    return_word = nil
    if params
      params.each do |param|
          if param.class == String and param.split(":")[0] == word
            return_word = param.split(":")[1]
            params.delete(param)
          end
      end
    end
    [params, return_word]
  end

  def actions_array
    begin
      action_name = self.configurations['action_name']
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
      self.configurations['action_name']
    rescue
      self.class.name.downcase
    end
  end

  def help client='console'
    begin
      message = self.configurations['help_message']
    rescue Exception => e
      message = 'The configuration file are corrupted or dont exist'
    end
    self.response('console',message)
    true
  end

  def call_service command, params
    begin
      result = action_obj(command).interpreter params, nil
    rescue Exception => e
      $acessSense.speak('console',"#{Initialize::messages['error_execute']} #{command}")
      Logger::log e, 'error'
    end
    result
  end

  def response client='console', message
    case client
    when 'console'
      $acessSense.speak('console',message)
    when 'web'
      p 'Web are no implemented'
    end
  end

end

