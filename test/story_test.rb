require 'minitest/autorun'
require 'minitest/pride'
require './lib/story'

class StoryTest < Minitest::Test

  def test_it_exists
    story = Story.new("U.S.",
                      "Politics",
                      "How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal",
                      "During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help.",
                      "https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html",
                      "2018-11-29T18:46:27-05:00",
                      "https://static01.nyt.com/images/2018/11/30/world/30trumpmoscow-1-print/30trumpmoscow7-articleInline.jpg"
                      )
    assert_instance_of Story, story
  end

  def test_it_has_attributes
    story = Story.new("U.S.",
                      "Politics",
                      "How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal",
                      "During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help.",
                      "https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html",
                      "2018-11-29T18:46:27-05:00",
                      "https://static01.nyt.com/images/2018/11/30/world/30trumpmoscow-1-print/30trumpmoscow7-articleInline.jpg"
                      )

    assert_equal "U.S.", story.section
    assert_equal "Politics", story.subsection
    assert_equal "How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal", story.title
    assert_equal "During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help.", story.abstract
    assert_equal "https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html", story.link
    assert_equal "2018-11-29T18:46:27-05:00", story.published_date
    assert_equal "https://static01.nyt.com/images/2018/11/30/world/30trumpmoscow-1-print/30trumpmoscow7-articleInline.jpg", story.photo
  end

  def test_it_loads_api
    file = "data/nytimes.json"

    stories = Story.load_stories(file)

    assert_equal 43, stories.count

    assert_equal "U.S.", stories[0].section
    assert_equal "Politics", stories[0].subsection
    assert_equal "How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal", stories[0].title
    assert_equal "During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help.", stories[0].abstract
    assert_equal "https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html", stories[0].link
    assert_equal "2018-11-29T18:46:27-05:00", stories[0].published_date
    assert_equal "https://static01.nyt.com/images/2018/11/30/world/30trumpmoscow-1-print/30trumpmoscow7-articleInline.jpg", stories[0].photo

  end

end
