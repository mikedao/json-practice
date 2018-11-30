require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/story'

class NytimesTest < Minitest::Test

  def test_it_exists
    story = Story.new(
      {section: "U.S.",
    subsection: "Politics",
    title: "How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal",
    abstract: "During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help.",
    link: "https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html",
    published: "2018-11-29T18:46:27-05:00",
    photo: "https://static01.nyt.com/images/2018/11/30/world/30trumpmoscow-1-print/30trumpmoscow7-articleInline.jpg",}
    )

    assert_equal Story, story.class
  end
end
