require 'minitest/autorun'
require 'minitest/pride'

require 'pry'

require "json"

require "./lib/story"


class StoryTest < Minitest::Test

  def setup
    file = File.read("./data/nytimes.json")
    data = JSON.parse(file)
    @result = data['results'].first
    @story  = Story.new(@result)
  end

  def test_it_has_attributes
    assert_eqaul @story.section,    @result["section"]
    assert_eqaul @story.subsection, @result["subsection"]
    assert_eqaul @story.title,      @result["title"]
    assert_eqaul @story.abstract,   @result["abstract"]
    assert_eqaul @story.link,       @result["url"]
  end

  def test_it_can_get_normal_photo_url
    photo = @result["multimedia"][2]["url"]
    assert_eqaul @story.photo, photo
  end

  def test_it_can_return_no_photo_available
    fake_story = @result.dupe
    fake_story["multimedia"][2]["url"] = nil
    story = @story.photo
    assert_eqaul "No Photo Available", story
  end

  def test_it_can_format_published_date
    date = @story.published
    assert_eqaul "November 29, 2018", date
  end

end
