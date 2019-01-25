require 'minitest/autorun'
require 'minitest/pride'
require './lib/story.rb'

class StoryTest < Minitest::Test
  
  def test_it_has_stories
    stories = Story.create_stories
    assert_equal 43, stories.count
  end
  
  def test_it_can_create_a_story
    story = Story.new("Politics", "US Politics", "Trump Does Stuff", "Yep", "url_here", "November 29, 2019", "photo_url")
    assert_instance_of Story, story
    assert_equal "Politics", story.section
    assert_equal "US Politics", story.subsection
    assert_equal "Trump Does Stuff", story.title
    assert_equal "Yep", story.abstract
    assert_equal "url_here", story.link
    assert_equal "November 29, 2019", story.published
    assert_equal "photo_url", story.photo
  end
  
end

#section - String

#subsection - String

#title - String - text containing the string of the story

#abstract - String - summary of the story

#link - String - URL of where the story is located

#published - String - Date that the story was published. Example format: "November 29, 2019"

#photo - String - URL of the normal sized photo if one exists. Otherwise it should be the string, "No Photo Available".