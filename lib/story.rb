require 'json'
require 'date'

class Story
  
  attr_reader :section,
              :subsection,
              :title,
              :abstract,
              :link,
              :published,
              :photo
              
  def initialize(story)
    @section = story["section"]
    @subsection = story["subsection"]
    @title = story["title"]
    @abstract = story["abstract"]
    @link = story["url"]
    @published = get_date(story["published_date"])
    @photo = get_photo(story["multimedia"])
  end
  
  def self.create_stories
    stories_raw = File.read("./data/nytimes.json")
    stories_hash = JSON.parse(stories_raw)["results"]
    stories_hash.map do |story|
      self.new(story)
    end
  end
  
  def get_photo(photos)
    normal_photo = photos.find do |photo|
      photo.values.include? "Normal"
    end
    normal_photo ? normal_photo["url"] : "No Photo Available"
  end
  
  def get_date(date_time)
    date = Date.parse(date_time.split('T').first)
    date.strftime('%B %e, %Y')
  end
end
