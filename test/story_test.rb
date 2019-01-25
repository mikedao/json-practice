require 'minitest/autorun'
require 'minitest/pride'
require './lib/story'
require 'pry'

class StoryTest < Minitest::Test
  def setup
    @json = Story.load_json
    @story = Story.new({
      section: "section",
      subsection: "subsection",
      title: "title",
      abstract: "abstract",
      link: "link",
      published: "published",
      photo: "photo"
      })
  end

  def test_it_exists
    assert_instance_of Story, @story
  end

  def test_it_can_translate_data
    assert_equal "section", @story.section
  end

  def test_response_of_section
    assert_equal "section", @story.section
    assert_equal "subsection", @story.subsection
    assert_equal "title", @story.title
    assert_equal "abstract", @story.abstract
    assert_equal "link", @story.link
    assert_equal "published", @story.published
    assert_equal "photo", @story.photo
  end

  def test_load_file_content
    assert_equal Story.load_json, @json
  end
end
