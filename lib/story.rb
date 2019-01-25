require 'json'

class Story

  attr_reader :section,
              :subsection,
              :title,
              :abstract,
              :link,
              :published,
              :photo

  def initialize(hash)
    @section = hash[:section]
    @subsection = hash[:subsection]
    @title = hash[:title]
    @abstract = hash[:abstract]
    @link = hash[:link]
    @published = hash[:published]
    @photo = hash[:photo]
  end


  def self.load_content
    file = File.read('./data/nytimes.json')
    parsed = JSON.parse(file, symbolize_names: true)[:results]
    story_data = parsed.map do |story|
      if story[:multimedia][2][:format] == "Normal"
        a = { section: story[:section],
          subsection: story[:subsection],
          title: story[:title],
          abstract: story[:abstract],
          link: story[:url],
          published: story[:published_date],
          photo: story[:multimedia][2][:url]
          }
      else
        { section: story[:section],
          subsection: story[:subsection],
          title: story[:title],
          abstract: story[:abstract],
          link: story[:url],
          published: story[:published_date],
          photo: "No Photo Avaliable, Sorry!"
          }
      end
    end
    array_o_storie = story_data.map do |data|
      Story.new(data)
    end
  end
end
