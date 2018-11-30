class Story
  attr_reader :section,
              :subsection,
              :title,
              :abstract,
              :link,
              :published,
              :photo

  def initialize(story_hash)
    @section = story_hash[:section]
    @subsection = story_hash[:subsection]
    @title = story_hash[:title]
    @abstract = story_hash[:abstract]
    @link = story_hash[:link]
    @published = story_hash[:published]
    @photo = story_hash[:photo]
  end

end
