require 'minitest/autorun'
require 'minitest/pride'
require './lib/story'
require 'pry'

class StoryTest < Minitest::Test

  def test_it_can_get_a_section
    story = Story.new

    assert_equal "U.S.", story.section(1)
    assert_equal "Technology", story.section(7)
  end

  def test_it_can_get_a_subsection
    story = Story.new

    assert_equal "Politics", story.subsection(1)
    assert_equal "", story.subsection(4)
  end

  def test_it_can_get_a_title
    story = Story.new

    expected = "How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal"
    assert_equal expected, story.title(1)

    expected_2 = "Trump Denies Business Dealings With Russia. His Former Lawyer Contradicts Him."
    assert_equal expected_2, story.title(2)
  end

  def test_it_can_get_an_abstract
    story = Story.new

    expected = "During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help."
    assert_equal expected, story.abstract(1)

    expected_2 = "For years, the president has denied that he had any business interests in Russia during the 2016 election. His former personal lawyer now says otherwise."
    assert_equal expected_2, story.abstract(2)
  end

  def test_it_can_get_a_link
    story = Story.new

    expected = "https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html"
    assert_equal expected, story.link(1)

    expected_2 = "https://www.nytimes.com/2018/11/29/us/politics/fact-check-cohen-trump-.html"
    assert_equal expected_2, story.link(2)
  end

  def test_it_can_get_published_date
    story = Story.new

    expected = "2018-11-29T18:46:27-05:00"
    assert_equal expected, story.published(1)

    expected_2 = "2018-11-29T19:55:33-05:00"
    assert_equal expected_2, story.published(2)
  end

  def test_it_can_get_a_photo_link
    story = Story.new

    expected = "https://static01.nyt.com/images/2018/11/30/world/30trumpmoscow-1-print/30trumpmoscow7-articleInline.jpg"
    assert_equal expected, story.photo(1)

    expected_2 = "https://static01.nyt.com/images/2018/11/30/us/politics/30dc-factcheck/merlin_147477981_80cf7251-5c79-4caa-a198-32c4ea269b77-articleInline.jpg"
    assert_equal expected_2, story.photo(2)
  end
end
