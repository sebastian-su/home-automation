require 'listen'
require 'yaml'

require_relative 'house.rb'

class HomeAutomation
  @current_dir = File.expand_path File.dirname(__FILE__)
  @config = YAML.load(File.open("#{@current_dir}/config/default.yml"))
  @house = House.new
  @folder = @config['path']
  @activity = false

  #Thread.new {
  #  listener = Listen.to(@folder) do
  #    @activity=true
  #  end
  #  listener.start
  #  sleep
  #}

  while true do
    @house.switch_all_on
    sleep 10
    @house.switch_all_off
    sleep 10
    @house.global_turn_off
    sleep 10
  end
end
