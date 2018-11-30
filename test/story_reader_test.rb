require 'minitest/autorun'
require 'minitest/pride'
require './lib/story_reader.rb'
require 'pry'
require 'json'

class StoryReaderTest <  Minitest::Test
  def setup
    @story_reader = StoryReader.new
    @hash = @story_reader.read
  end

  def test_it_exists
    assert_instance_of StoryReader, @story_reader
  end

  def test_it_can_read
    assert_instance_of Hash, @hash
  end

end
