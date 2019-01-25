require 'json'
require 'story.rb'

class StoryLoader
  attr_reader :stories

  def initialize(file)
    @data = file
  end

  def load_stories
    file = File.read(@data)
    story_data = JSON.parse(file)["results"]
    collection = []
    story_data.each do |hash|
      a_story = Story.new(hash)
      collection << a_story
    end
    stories = collection
  end
end
