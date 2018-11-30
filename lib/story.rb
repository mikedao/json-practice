require_relative './story_reader.rb'
require 'json'
require 'pry'

class Story
  attr_reader :story_data
  def initialize(story_data)
    @story_data = StoryReader.new.read
  end

  def section
    @story_data["results"][0]["section"]
  end

  def subsection
    @story_data["results"][0]["subsection"]
  end

  def title
    @story_data["results"][0]["title"]
  end

  def abstract
    @story_data["results"][0]["abstract"]
  end

  def link
    @story_data["results"][0]["url"]
  end

  def published
    @story_data["results"][0]["published_date"]
  end

  def photos
    @story_data["results"][0]["multimedia"].map do |photo|
      if
      photo["format"] == "Normal"
      photo["results"][0]["multimedia"][0]["url"]
      end
    end
  end
end
