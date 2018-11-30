require 'Date'

class Story
  attr_reader :section,
              :subsection,
              :title,
              :abstract,
              :link,
              :published

  def initialize(hash)
    @section = hash[:section]
    @subsection = hash[:subsection]
    @title = hash[:title]
    @abstract = hash[:abstract]
    @link = hash[:url]
    @published = Date.parse(hash[:published_date]).strftime("%B %d,%Y")
    # @photo = hash["multimedia"]["normal"]
  end

end
