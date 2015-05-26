require 'yaml'

$know = {}
class BaseModel

  def initialize dir
    self.know_array dir
  end

  def know_array dir
    configurations = YAML::load_file(File.join(dir, 'config.yml'))
    begin
      action_name = configurations['configurations']['action_name']
    rescue
      action_name = self.class.name.downcase
    end
    $know[action_name] = self
  end

  def self.get name
    $know[name]
  end

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