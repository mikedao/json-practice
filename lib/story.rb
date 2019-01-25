#code goes here
class Story
  attr_reader :section, :subsection, :title, :abstract, :link, :published, :photo

  file = File.read('./data/nytimes.json')
  json = JSON.parse(file)
  results = json["results"]

  def initialize(results)
    @section = results[]
    @subsection =
    @title =
    @abstract =
    @link =
    @published =
    @photo =
    story = Story.new()
  end

  def something
    results.each do |story|

  end

end





#section - String

#subsection - String

#title - String - text containing the string of the story

#abstract - String - summary of the story

#link - String - URL of where the story is located

#published - String - Date that the story was published. Example format: "November 29, 2019"

#photo - String - URL of the normal sized photo if one exists. Otherwise it should be the string, "No Photo Available".
