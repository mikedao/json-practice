#code goes here
require 'awesome_print'
require 'json'
require 'date'

class Story
  attr_reader :section, :subsection, :title, :abstract, :url, :published_date, :photo

  def initialize(**attributes)
    @section = attributes[:section]
    @subsection = attributes[:subsection]
    @title = attributes[:title]
    @abstract = attributes[:abstract]
    @url = attributes[:url]
    @published_date = Date.parse(attributes[:published_date]).strftime("%B %d, %Y")
    @photo = attributes[:photo] || "No Photo Available"
  end

  def self.json_load
    stories = JSON.load(File.new('./data/nytimes.json'))
    @story_object = stories["results"].map do |story|
      hash = {
        section: story["section"],
        subsection: story["subsection"],
        title: story["title"],
        abstract: story["abstract"],
        url: story["url"],
        published_date: story["published_date"],
        photo: story["multimedia"][2]["url"]
      }
      Story.new(hash)
    end
    @story_object
  end
end
