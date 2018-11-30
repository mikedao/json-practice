require 'json'
require 'pry'
class Story
  def initialize
    file = File.read('data/nytimes.json')
    data_hash = JSON.parse(file)
  end
end
