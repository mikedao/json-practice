require 'json'

class Story 
  attr_reader :section, 
              :subsection,
              :title,
              :abstract,
              :link, 
              :published, 
              :photo
              
  def initialize(data)
    @section = data["section"]
    @subsection = data["subsection"]
    @title = data["title"]
    @abstract =  data["abstract"]
    @link =  data["url"]
    @published =  data["published_date"]
    photo =  data["multimedia"].map do |hash|
                if hash["format"] == "Normal"
                  hash["url"]
                end
              end
    @photo = photo.join
  end 
end 
