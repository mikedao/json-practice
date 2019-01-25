require 'json'

class Story
  attr_reader :section, :subsection, :title,
              :abstract, :link, :published,
              :photo

  def initialize(data = {})
    @section = data[:section]
    @subsection = data[:subsection]
    @title = data[:title]
    @abstract = data[:abstract]
    @link = data[:url]
    @published = data[:published_date]
    @photo = data[:multimedia]
  end

  def self.load_json
    file = File.read('./data/nytimes.json')
    stories = JSON.parse(file, symbolize_names: true)
    all = stories[:results].each do |story|
      hash = {section: story[:section], subsection: story[:subsection],
      title: story[:title], abstract: story[:abstract], link: story[:url],
      published: story[:published_date], photo: story[:multimedia].first}
      Story.new(hash)
    end
    all
  end
end
