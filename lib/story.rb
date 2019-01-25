require 'json'
require 'time'
require 'pry'

class Story
  attr_reader :section, :subsection, :title, :abstract, :link, :published, :photo

  def initialize(args)
    @section = args[:section]
    @subsection = args[:subsection]
    @title = args[:title]
    @abstract = args[:abstract]
    @link = args[:link]
    @published = args[:published]
    @photo = args[:photo] || "No Photo Available"
  end

  def self.from_json(file_path)
    data = JSON.parse(File.read(file_path))["results"]
    data.map do |story|
      self.new(self.parse_story(story))
    end
  end

  def self.parse_story(story)
    section, subsection, title = story["section"], story["subsection"], story["title"]
    abstract, link = story["abstract"], story["url"]
    published = Time.parse(story["published_date"]).strftime('%B %d, %Y')
    photo_url = story["multimedia"].select{|media| media["format"] == "Standard Thumbnail"}[0]["url"] || "No Photo Available"
    {
      section: section,
      subsection: subsection,
      title: title,
      abstract: abstract,
      link: link,
      published: published,
      photo_url: photo_url,
    }
  end
end
