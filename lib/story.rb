require 'pry'

class Story

  def initialize(hash)
    @section = hash[:section]
    @subsection = hash[:subsection]
    @title = hash[:title]
    @abstract = hash[:abstract]
    @link = hash[:link]
    @published = hash[:published]
    @photo = hash[:photo]
  end
end
