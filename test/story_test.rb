require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/story'

class StoryTest < Minitest::Test
  def test_it_exists
    params = {section: 'string', subsection: 'string', title: 'string', abstract: 'abstract', link: 'link', published: 'published', photo: 'photo'}
    story = Story.new(params)
    assert_instance_of Story, story
  end

  def test_it_has_access_to_correct_data_sections
    params = {section: 'section', subsection: 'subsection', title: 'title', abstract: 'abstract', link: 'link', published: 'published', photo: 'photo'}
    story = Story.new(params)
    assert_equal story.section, 'section'
    assert_equal story.subsection, 'subsection'
    assert_equal story.title, 'title'
    assert_equal story.abstract, 'abstract'
    assert_equal story.link, 'link'
    assert_equal story.published, 'published'
    assert_equal story.photo, 'photo'
  end

  def test_it_returns_array_for_parser
    story_array = Story.parse_json(@json_reply)
    assert_instance_of Array, story_array
  end

  def test_it_returns_array_for_parser
    raw_json = File.read('./data/nytimes.json')
    json = JSON.parse(raw_json)
    story_array = Story.parse_json(json)
    assert_instance_of Array, story_array
  end

  def test_it_returns_story_instances_back_with_correct_data
    raw_json = File.read('./data/nytimes.json')
    json = JSON.parse(raw_json)
    story_array = Story.parse_json(json)
    story = story_array.first
    assert_instance_of Story, story
    assert_equal story_array.length, 43

    expected_section = "U.S."
    expected_subsection = "Politics"
    expected_title = "How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal"
    expected_abstract = "During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help."
    expected_link = "https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html"
    expected_published = "2018-11-29T18:46:27-05:00"
    expected_photo = "https://static01.nyt.com/images/2018/11/30/world/30trumpmoscow-1-print/30trumpmoscow7-articleInline.jpg"

    assert_equal story.section, expected_section
    assert_equal story.subsection, expected_subsection
    assert_equal story.title, expected_title
    assert_equal story.abstract, expected_abstract
    assert_equal story.link, expected_link
    assert_equal story.published, expected_published
    assert_equal story.photo, expected_photo

    story_2 = story_array.first
    assert_instance_of Story, story
    assert_equal story_array.length, 43

    expected_section = "U.S."
    expected_subsection = "Politics"
    expected_title = "How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal"
    expected_abstract = "During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help."
    expected_link = "https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html"
    expected_published = "2018-11-29T18:46:27-05:00"
    expected_photo = "https://static01.nyt.com/images/2018/11/30/world/30trumpmoscow-1-print/30trumpmoscow7-articleInline.jpg"

    assert_equal story_2.section, expected_section
    assert_equal story_2.subsection, expected_subsection
    assert_equal story_2.title, expected_title
    assert_equal story_2.abstract, expected_abstract
    assert_equal story_2.link, expected_link
    assert_equal story_2.published, expected_published
    assert_equal story_2.photo, expected_photo
  end
end