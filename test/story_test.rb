require 'minitest/autorun'
require 'minitest/pride'
require './lib/story'
require 'pry'

class StoryTest < MiniTest::Test
  def setup
    data = File.read('./data/nytimes.json')
    @data_hash = JSON.parse(data)
  end

  def test_it_exists
    story = Story.new(@data_hash)
    assert_instance_of Story, story
  end

  def test_it_returns_a_array_of_stories
    story_array = Story.create_story_array
    assert_equal story_array.count, 43
  end

  def test_if_no_photo_is_present_it_has_a_default
    story_array = Story.create_story_array

    assert_equal story_array[28].photo, "No Photo Available"
  end

  def test_it_can_return_its_values
    story_array = Story.create_story_array
    story = story_array[0]

    assert_equal story.section, "U.S."
    assert_equal story.subsection, "Politics"
    assert_equal story.title, "How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal"
    assert_equal story.abstract, "During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help."
    assert_equal story.link, "https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html"
    assert_equal story.published, "November 29, 2018"
    assert_equal story.photo, "https://static01.nyt.com/images/2018/11/30/world/30trumpmoscow-1-print/30trumpmoscow7-articleInline.jpg"
  end
end
