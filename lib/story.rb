#code goes here
times = JSON.parse(File.read("../data/nytimes.json"))

class Story
    attr_reader :section, :subsection, :title, :link, :published, :photo

    def initialize(section, subsection, title, link, published, photo)
        @section = section
        @subsection = subsection
        @title = title
        @link = link 
        @published = published
        @photo = photo 
    end
end 

ruby_articles = times["results"].map do |result|
    Story.new(result["section"], result["subsection"], result["title"], result["url"], result["published_date"], result["multimedia"].first["url"])
end

