require 'erb'
require 'net/http'
require 'nokogiri'

class Steps
  def render
    content = File.read(File.expand_path(File.dirname(__FILE__) + "/views/" + @erb))
    template = ERB.new(content)
    template.result(binding)
  end
end

class StepOne < Steps
  def initialize
    @erb = 'stepOne.erb'
  end
end

