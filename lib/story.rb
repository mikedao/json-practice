require 'json'

class Story

  attr_reader :section,
              :subsection,
              :title,
              :abstract,
              :link,
              :published,
              :photo

  def initialize(hash)
    @section = hash[:section]
    @subsection = hash[:subsection]
    @title = hash[:title]
    @abstract = hash[:abstract]
    @link = hash[:url]
    @published = hash[:published_date]
    @photo = hash[:photo]
  end


  def self.load
    file = File.read('./data/nytimes.json')

  end


end
