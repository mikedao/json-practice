require 'pry'

class Story
  attr_reader :section,
              :subsection,
              :title,
              :abstract,
              :link,
              :published,
              :photo

  def initialize(hash)
    story_hash = hash['results']
    @section = story_hash['section']
    @subsection = story_hash['subsection']
    @title = story_hash['title']
    @abstract = story_hash['abstract']
    @link = story_hash['link']
    @published = story_hash['published']
    @photo = assign_photo_url(story_hash)
  end

  def assign_photo_url(story_hash)
    photos_hash = story_hash['multimedia']
    photos_hash.find_all do |photo_hash|
      if photo_hash['format'] == 'Normal'
        return photo_hash['url']
      else
        return "No Photo Available"
      end
    end
  end
end
