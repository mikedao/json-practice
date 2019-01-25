require 'minitest/autorun'
require 'pry'
require 'json'
require './lib/story'

class StoryTest < Minitest::Test

  def test_it_exists
    story = Story.new({section: "US", subsection: "Colorado", title: "Marijuana", abstract: "Mile High City Life", link: "www.denver.com", published: "2018-11-29 18:46:27-05:00", photo: "No Photo Available" })
    assert_instance_of Story, story
  end

  def test_that_it_initializes_with_attributes
    story = Story.new({section: "US", subsection: "Colorado", title: "Marijuana", abstract: "Mile High City Life", link: "www.denver.com", published: "2018-11-29 18:46:27-05:00", photo: "No Photo Available" })

    assert_equal ("US"), story.section
    assert_equal ("Colorado"), story.subsection
    assert_equal ("Marijuana"), story.title
    assert_equal ("Mile High City Life"), story.abstract
    assert_equal ("www.denver.com"), story.link
    assert_equal ("November 29, 2018"), story.published
    assert_equal ("No Photo Available"), story.photo
  end

  def test_that_it_can_make_an_array_of_stories
    array_of_stories = Story.make_stories

    assert_equal (43), array_of_stories.count
  end
end
