require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/story'
require './lib/json_loader.rb'

class JsonLoaderTest < Minitest::Test

  def test_it_exists
    json_loader = JsonLoader.new

    assert_equal JsonLoader, json_loader.class
  end

  def test_it_loads_story_objects_into_an_array
    json_loader = JsonLoader.load_articles('./data/nytimes.json')

    assert_equal Array, json_loader.class 
  end
end
