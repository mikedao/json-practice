require "./lib/story"

class StoryRepo

  attr_accessor :stories

  def initialize
    @stories = []
  end

  def add_story(hash)
    @stories << Story.new(hash)
  end

  def add_story_collection(array)
    array.each { |hash| add_story(hash) }
  end


end
