require 'minitest/autorun'
require './lib/story'

class StoryTest < Minitest::Test

  def setup
    @story = Story.new({
      :section => "some section",
      :subsection => "some subsection",
      :title => "Some Story",
      :abstract => "some abstract",
      :link => "somelink.com",
      :published => "some publishing",
      :photo => "somephoto.com"
    })
  end

  def test_it_exists
    assert_instance_of Story, @story
  end

  def test_it_has_attributes
    assert_equal "some section", @story.section
    assert_equal "some subsection", @story.subsection
    assert_equal "Some Story", @story.title
    assert_equal "some abstract", @story.abstract
    assert_equal "somelink.com", @story.link
    assert_equal "some publishing", @story.published
    assert_equal "somephoto.com", @story.photo
  end
end