class Story

  attr_reader :section, 
              :subsection, 
              :title, 
              :abstract, 
              :link, 
              :published, 
              :photo,
              :results,
              :create_stories

  def initialize(section, 
                 subsection, 
                 title, 
                 abstract, 
                 link, 
                 published, 
                 photo)
    @section = section
    @subsection = subsection
    @title = title
    @abstract = abstract
    @link = link
    @published = published
    @photo = photo
  end

  def self.results
    file = File.read('./data/nytimes.json')
    hash = JSON.parse(file)
    return hash["results"]
  end

  def self.create_stories
    results = self.results
    stories = []
    results.each do |result|
      section = result["section"]
      subsection = result["section"]
      title = result["title"]
      abstract = result["abstract"]
      link = result["url"]
      published = Date.parse(@hash.first["published_date"])
      # didn't quite get there with the date format
      photo_hash = result["multimedia"].find{|i|i["format"] == "Normal"}
      photo = photo_hash ? photo_hash["url"] : "No Photo Available"
      
      story = Story.new(section, subsection, title, abstract, link, published, photo)
      stories << story
    end
    return stories
  end

end