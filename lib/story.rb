require 'json'

class Story

  def initialize(attributes)
    @section = attributes[:name]
    @subsection = attributes[:subsection]
    @link = attributes[:link]
    @published = attributes[:published]
    @photo = attributes[:photo]
    @title = attributes[:title]
    @abstract = attributes[:abstract]
  end

end
