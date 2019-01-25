require 'json'

class Story
  
  def self.create_stories
    stories_raw = File.read("./data/nytimes.json")
    stories_hash = JSON.parse(stories_raw)
    
  end

end
