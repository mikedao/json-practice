require 'json'

class Story
  attr_reader :section, :subsection, :title, :abstract, :link, :published, :photo

  def initialize(index)
    @story_array = Story.story_parser["results"]
    @section = @story_array[index]["section"]
    @subsection = @story_array[index]["subsection"]
    @title = @story_array[index]["title"]
    @abstract = @story_array[index]["abstract"]
    @link = @story_array[index]["url"]
    @published = @story_array[index]["published_date"]
    @photo = normal_photo(index)
  end

  def self.story_parser
    data_file = File.read("./data/nytimes.json")
    parsed_story = JSON.parse(data_file)
  end

  def normal_photo(index)
    value = 'No Photo Available'

    @story_array[index]["multimedia"].each do |photo|
      if photo["format"] == "Normal"
        value = photo["url"]
      end
    end
    value
  end

end
