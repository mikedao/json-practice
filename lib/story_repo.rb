require 'json'
require 'pry'
require_relative 'story.rb'

class StoryRepo

  attr_reader :data_file, :stories

  def initialize(data_file, stories=[])
    @data_file = data_file
    @stories = stories
  end

  def load_file(file)
    file = File.read(@data_file)
    data_hash = JSON.parse(file)
    data_hash["results"].map! do |attributes|
      attributes["section"] if attributes["section"]
      attributes["subsection"] if attributes["subsection"]
      attributes["link"] if attributes["link"]
      attributes["published"] if attributes["published"]
      attributes["photo"] if attributes["photo"]
      attributes["title"] if attributes["title"]
      attributes["abstract"] if attributes["abstract"]
    end
      new_story = Story.new(data_hash)
      @stories << new_story
  end

end
