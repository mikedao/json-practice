require "minitest/autorun"
require 'minitest/pride'
require 'pry'
require './lib/story.rb'
require 'json'

class StoryTest < Minitest::Test
  def test_it_has_attributes
    article = {section: "U.S.",
               subsection: "Politics",
               title: "How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal",
               abstract: "During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help.",
               link: "https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html",
               published: "2018-11-29T18:46:27-05:00",
               photo: "https://static01.nyt.com/images/2018/11/30/world/30trumpmoscow-1-print/30trumpmoscow7-thumbStandard.jpg"
            }

    story = Story.new(article)
    assert_instance_of Story, story
    assert_equal "U.S.", story.section
    assert_equal "Politics", story.subsection
    assert_equal "How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal", story.title
    assert_equal "During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help.", story.abstract
    assert_equal "https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html", story.link
    assert_equal "2018-11-29T18:46:27-05:00", story.published
    assert_equal "https://static01.nyt.com/images/2018/11/30/world/30trumpmoscow-1-print/30trumpmoscow7-thumbStandard.jpg", story.photo
  end

  def test_it_can_create_articles
    all_the_stories = Story.load_content
    assert_equal(all_the_stories.count, 43)
  end
end
