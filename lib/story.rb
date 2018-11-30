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
    @subsection = args[:subsection]
    @title = args[:title]
    @abstract = args[:abstract]
    @link = args[:link]
    @published = args[:published]
    @photo = args[:photo]
  end

  def self.create_story_array
    data = File.read('./data/nytimes.json')
    data_hash = JSON.parse(data)["results"]
    data_array = data_hash.map do |hash|
      {section: hash["section"],
      subsection: hash["subsection"],
      title: hash["title"],
      abstract: hash["abstract"],
      link: hash["url"],
      published: reformat_date(hash["published_date"]),
      photo: check_for_photo(hash["multimedia"][2]["url"])}
    end

    data_array.map do |args|
      Story.new(args)
    end
  end

  def self.check_for_photo(photo)
    if photo == ""
      "No Photo Available"
    else
      photo
    end
  end

  def self.reformat_date(date)
    year = date[0] + date[1] + date[2] + date[3]
    month = Date::MONTHNAMES[(date[5] + date[6]).to_i]
    day = date[8] + date[9]
    "#{month} #{day}, #{year}"
  end
end
