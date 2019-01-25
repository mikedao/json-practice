require 'Date'
class Story
  attr_reader :section,
              :subsection,
              :title,
              :abstract,
              :link,
              :published,
              :photo
  def initialize(data)
    @section = data["section"]
    @subsection = data["subsection"]
    @title = data["title"]
    @abstract = data["abstract"]
    @link = data["url"]
    @published = Date.parse(data["published_date"]).strftime("%B %d, %Y")
    @photo = photo_maker(data["multimedia"])
  end

  def photo_maker(data)
    determine = false
    image = []
    data.each do |hash|
      if hash["format"] == "Normal"
        determine = true
        image << hash["url"]
      end
    end
    if determine == true
      return image.first
    else
      return "No photo available"
    end
  end
end
