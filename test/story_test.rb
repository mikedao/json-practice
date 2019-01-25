require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/story'

class StoryTest < Minitest::Test
  def setup
    @story = Story.new(section: "U.S.", subsection: "Politics", title: "Chocolate", abstract: "Peanut Butter", link: "facebook.com", published: "1970-1-1T00:00:00-00:00", photo: "google.com")
  end

  def test_it_exists
    assert_instance_of Story, @story
  end

  def test_it_inits_correctly
    assert_equal "U.S.", @story.section
    assert_equal "Politics", @story.subsection
    assert_equal "Chocolate", @story.title
    assert_equal "Peanut Butter", @story.abstract
    assert_equal "facebook.com", @story.link
    assert_equal "1970-1-1T00:00:00-00:00", @story.published
    assert_equal "google.com", @story.photo
  end

  def test_it_can_load_from_json
    stories = Story.load_from_json
    assert_equal 43, stories.length
    stories.each do |story|
      assert_instance_of Story, story
    end
  end
end
