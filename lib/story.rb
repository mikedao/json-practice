require 'json'
require 'pry'
class Story
  attr_reader :section, :subsection, :title, :abstract

  def initialize(index, file_path)
    file = File.read('data/nytimes.json')
    data_hash = JSON.parse(file)
    stories = data_hash["results"][index]

    @section = stories["section"]
    @subsection = stories["subsection"]
    @title = stories["title"]
    @abstract = stories["abstract"]
  end
end
