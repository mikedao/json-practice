require 'json'

class Collection
  attr_reader :stories

  def initialize()
    @stories = []
  end

  def load_data
    file = File.read("./data/nytimes.json")
    data = JSON.parse(file)["results"]

    data.each do |story|
      new_story = Story.new({
        section: story["section"],
        subsection: story["subsection"],
        title: story["title"],
        abstract: story["abstract"],
        link: story["url"],
        published: story["published_date"],
        photo: normal_photo(story["multimedia"])
        })
      @stories << new_story
    end
  end

  def normal_photo(photo_hash)
    #oops ran out of time
  end
end
