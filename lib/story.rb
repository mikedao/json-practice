require 'json'
require 'pry'

class Story
  attr_reader :section,
              :subsection,
              :title,
              :abstract,
              :link,
              :published_date,
              :photo

  def initialize(section, subsection, title, abstract, link, published_date, photo)
    @section = section
    @subsection = subsection
    @title = title
    @abstract = abstract
    @link = link
    @published_date = published_date
    @photo = photo
  end

  def self.load_stories(file)
    read_file = File.read(file)
    parsed_json = JSON.parse(read_file)

    parsed_json["results"].map do |result|
      Story.new(result["section"],
                   result["subsection"],
                   result["title"],
                   result["abstract"],
                   result["url"],
                   result["published_date"],
                   result["multimedia"][2]["url"]
                  )
    end
  end


end
