require 'json'
require './lib/story'

class StoryService
  
  def read_data
    raw_data = File.read('./data/nytimes.json')
    parsed_data = JSON.parse(raw_data)
  end

  def create_stories
    story_collection = []
    read_data["results"].each do |story|
      story_collection << Story.new(story)
    end
    story_collection
  end
  
end