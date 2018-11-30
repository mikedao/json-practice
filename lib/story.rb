require 'json'

class Story
  attr_reader :section,
  :subsection,
  :title,
  :abstract,
  :link,
  :published,
  :photo

  def initialize(stuff)
    @section = stuff[:section]
    @subsection = stuff[:subsection]
    @title = stuff[:title]
    @abstract = stuff[:abstract]
    @link = stuff[:link]
    @published = stuff[:published]
    @photo = stuff[:photo]
  end

  def create_things
    file = File.read("./data/nytimes.json")
    data_hash = Json.parse(file)["results"]
      data_hash.map do |d|
        if data_hash[:multimedia][2][:format] == "Normal"
        {
          section: d["section"]
          subsection: d["subsection"]
          title: d["title"]
          abstract: d["abstract"]
          link: d["link"]
          published: d["published"]
          photo: d["multimedia"][2]["url"]
        }
      else
        {
          section: d["section"]
          subsection: d["subsection"]
          title: d["title"]
          abstract: d["abstract"]
          link: d["link"]
          published: d["published"]
          photo: "No Photo Available"
        }
      end
    end

  end

end
