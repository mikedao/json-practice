require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/story'


class StoryTest < Minitest::Test
  def test_it_exists
    story = Story.new
    binding.pry
    assert_instance_of Story, story
  end

  def test_json_data_loads
    @file = File.read('data/nytimes.json')
    @data_hash = JSON.parse(file)
  end
end
