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
    @link = data["link"]
    @published = data["published"]
    @photo = data["multimedia"].first["url"]
  end
end
