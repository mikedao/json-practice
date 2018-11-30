require 'minitest/autorun'
require 'minitest/pride'
require './lib/story_reader.rb'
require './lib/story.rb'
require 'pry'
require 'json'

class StoryTest <  Minitest::Test
  def setup
    @story_data = StoryReader.new
    @story = Story.new(@story_data)
  end

  def test_it_exists
    assert_instance_of Story, @story
  end

  def test_it_can_read
    assert_instance_of Hash, @story.story_data
  end

  def test_it_has_a_section
    assert_equal @story.story_data["results"][0]["section"], @story.section
    assert_equal "U.S.", @story.section
  end

  def test_it_has_a_section
    assert_equal "Politics", @story.subsection
  end

  def test_it_has_a_title
    assert_equal "How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal", @story.title
  end

  def test_it_has_a_link
    assert_equal "https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html", @story.link
  end

  def test_it_has_a_published_date
    assert_equal "2018-11-29T18:46:27-05:00", @story.published
  end

  def test_it_has_photos
    assert_instance_of Array, @story.photos
  end
end
