require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/story'


class StoryTest < Minitest::Test

  # def setup
  #   @hash = Story::DATA
  # end

  def test_it_can_load_data
    result = Story.json_load

    assert_equal 43, result.count
  end

  def test_each_section_is_a_string
    # binding.pry
    result = Story.json_load.first.section
    result_last = Story.json_load.last.section
    assert_equal "U.S.", result
    assert_equal "Well", result_last
  end

  def test_each_subsection_is_a_string
    result = Story.json_load.first.subsection
    result_last = Story.json_load.last.subsection

    assert_equal "Politics", result
    assert_equal "Eat", result_last
  end

  def test_it_can_return_story_title
    result = Story.json_load.first.title
    assert_equal "How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal", result
  end

  def test_it_can_return_an_abstract
    result = Story.json_load.first.abstract
    assert_equal "During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help.", result
  end

  def test_it_can_return_a_link_to_story
    result = Story.json_load.first.url
    assert_equal "https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html", result
  end

  def test_it_can_return_published_date
    result = Story.json_load.first.published_date
    assert_equal "November 29, 2018", result
  end

  def test_it_returns_photo_url_if_one_exists
    result = Story.json_load.first.photo
    assert_equal "https://static01.nyt.com/images/2018/11/30/world/30trumpmoscow-1-print/30trumpmoscow7-articleInline.jpg", result
  end
end
