require 'json'

class Story

  # def load_file(file)
  #   file = File.read('data/nytimes.json')
  #   data_hash = JSON.parse(file)
  #   data_hash.map do |key, value|
  #     data_hash["section"] = data_hash["section"].to_i
  #     data_hash["subsection"] = data_hash["subsection"]
  #     data_hash["link"] = data_hash["link"]
  #     data_hash["published"] = data_hash["published"]
  #     data_hash["photo"] = data_hash["photo"]
  #     data_hash["title"] = data_hash["title"]
  #     data_hash["abstract"] = data_hash["abstract"]
  #     Story.new(data_hash)
  #   end
  # end

  def initialize(attributes)
    @section = attributes[:name]
    @subsection = attributes[:subsection]
    @link = attributes[:link]
    @published = attributes[:published]
    @photo = attributes[:photo]
    @title = attributes[:title]
    @abstract = attributes[:abstract]
  end



end
