# require './data/nytimes.json'

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
end
