require 'json'

class Story
  attr_reader :section, :subsection, :title, :abstract,
              :link, :published, :photo

  def initialize(**opts)
    @section = opts[:section]
    @subsection = opts[:subsection]
    @title = opts[:title]
    @abstract = opts[:abstract]
    @link = opts[:link]
    @published = opts[:published]
    @photo = opts[:photo] || "No Photo Available"
  end

  def self.load_from_json
    json = JSON.load(File.new('./data/nytimes.json'))

    stories = json["results"].map do |json_story|
      hash = {
        section: json_story["section"],
        subsection: json_story["subsection"],
        title: json_story["title"],
        abstract: json_story["abstract"],
        link: json_story["url"],
        published: json_story["published_date"],
        photo: json_story["multimedia"].first["url"],
      }
      Story.new(hash)
    end
  end
end
