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
    

  end

end
