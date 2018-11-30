require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/story'

class StoryTest < Minitest::Test
  def test_it_exists
    story = Story.new(0, './data/nytimes.json')
    assert_instance_of Story, story
  end

  def test_json_data_loads
    file = File.read('data/nytimes.json')
    data_hash = JSON.parse(file)

    assert_instance_of Hash, data_hash
  end

  def test_it_has_attributes
    story = Story.new(0, './data/nytimes.json')
    assert_equal 'U.S.', story.section
    assert_equal 'Politics', story.subsection
    assert_equal "How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal", story.title
    assert_equal "During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help.", story.abstract
  end
end
