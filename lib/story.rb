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
    @photo = photo_maker(data["multimedia"].first["url"])
  end

  def photo_maker(data)
    if data.length > 0
      data
    else
      "No photo available"
    end
  end
end
