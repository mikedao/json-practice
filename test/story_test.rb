require 'minitest/autorun'
require 'minitest/pride'
require './lib/story'
require 'pry'

class StoryTest <Minitest::Test
  def test_it_can_access_nytimes_hash
    story = Story.new(File.read('./data/nytimes.json'))

    assert_instance_of Story, story
  end

  def test_it_can_get_section
    story = Story.new(File.read('./data/nytimes.json'))

    section = story.section

    assert_instance_of String, section
  end
end
