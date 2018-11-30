require 'minitest/autorun'
require 'minitest/pride'
require './lib/story_service'
require 'json'

class StoryTest < Minitest::Test
  
  def test_it_reads_data
    service = StoryService.new
    data_hash = service.read_data
    assert_instance_of Hash, data_hash
  end
  
  def test_it_created_stories
    service = StoryService.new
    create_story = service.create_stories
    assert_instance_of Story, create_story
  end
end