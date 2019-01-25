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

  def initialize(attributes = {})
    @section = attributes[:section]
    @subsection = attributes[:subsection]
    @title = attributes[:title]
    @abstract = attributes[:abstract]
    @link = attributes[:link]
    @published = Date.parse(attributes[:published]).strftime("%B %d, %Y")
    @photo = attributes[:photo] || "No Photo Available"
  end

  def self.make_stories
    response = JSON.load(File.new('./data/nytimes.json'))
    @stories = response["results"].map do |result|
      all_attributes = { section: result["section"],
        subsection: result["subsection"],
        title: result["title"],
        abstract: result["abstract"],
        link: result["url"],
        published: result["published_date"],
        photo: result["multimedia"][2]["url"]
      }
      Story.new(all_attributes)
    end
    @stories
  end

end
