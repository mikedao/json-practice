require 'json'

class StoryReader
  attr_reader :read

def read
  file = File.read('./data/nytimes.json')
  hash = JSON.parse(file)
end


end
