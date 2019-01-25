#code goes here
require 'json'
class Story
  attr_reader :section, :subsection, :title, :abstract, :link, :published, :photo

  def initialize(story_hash)
    @section = story_hash["section"]
    @subsection = story_hash["subsection"]
    @title = story_hash["title"]
    @abstract = story_hash["abstract"]
    @link = story_hash["url"]
    @published = story_hash["published_date"]
    @photo = story_hash["multimedia"][2]["url"]

  end

  def self.create_stories
    file = File.read('./data/nytimes.json')
    json = JSON.parse(file)
    results = json["results"]
    results.map do |story|
      self.new(story)
    end
  end


end





#section - String

#subsection - String

#title - String - text containing the string of the story

#abstract - String - summary of the story

#link - String - URL of where the story is located

#published - String - Date that the story was published. Example format: "November 29, 2019"

#photo - String - URL of the normal sized photo if one exists. Otherwise it should be the string, "No Photo Available".
