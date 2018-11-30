#code goes here
require 'pry'
require 'json'
class Story

  attr_reader :section,
              :subsection,
              :title,
              :abstract,
              :link,
              :published,
              :photo

  def initialize(story_number, file_path)
    file = File.read(file_path)
    hash = JSON.parse(file)
    story_hash = hash["results"][story_number]
    @section = story_hash["section"]
    @subsection = story_hash["subsection"]
    @title = story_hash["title"]
    @abstract = story_hash["abstract"]
    @link = story_hash["url"]
    @published = story_hash["published_date"]

    story_hash["multimedia"].each do |image_attr|
      if image_attr["format"] == "Normal"
        @photo = image_attr["url"]
      end
    @photo = "No Photo Available" unless @photo

    end

  end

  def self.process(file_path)
    file = File.read(file_path)
    hash = JSON.parse(file)
    results = []
    for i in 0..(hash["num_results"]-1) do
      results << Story.new(i, file_path)
    end
    results
  end

end
