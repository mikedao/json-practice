require './lib/story'

class StoryTest < Minitest::Test

  def test_it_exists
    story = Story.new()

    assert_instance_of Story, story
  end

  def test_it_loads_json
    objects = Story.load_file("/data/nytimes.json")

    assert_instance_of Hash, objects
  end
end
