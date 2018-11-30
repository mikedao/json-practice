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

  def initialize(args)
    @section = args[:section]
    @subsection  = args[:subsection]
    @title  = args[:title]
    @abstract  = args[:abstract]
    @link  = args[:link]
    @published  = args[:published]
    @photo  = args[:photo]
  end

  def self.create_array
    file = File.read('./data/nytimes.json')

    story_data_array = JSON.parse(file)["results"]

    story_hash_array = story_data_array.map do |story|
      if story["multimedia"][2]["format"] == "Normal"
        { section: story["section"],
          subsection: story["subsection"],
          title: story["title"],
          abstract: story["abstract"],
          link: story["link"],
          published: reformat_published(story["published"]),
          photo: story["multimedia"][2]["url"]
        }
      else
        { section: story["section"],
          subsection: story["subsection"],
          title: story["title"],
          abstract: story["abstract"],
          link: story["link"],
          published: reformat_published(story["published"]),
          photo: "No Photo Available"
        }
      end
    end

    story_object_array = story_hash_array.map do |article_hash|
      Story.new(article_hash)
    end

    story_object_array
  end

  def self.reformat_published(published)
    date_object = Date.parse("2018-11-29T18:46:27-05:00")
    new_published = date_object.strftime('%B %d, %Y')
  end

end
