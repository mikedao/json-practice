require './test/test_helper'
require_relative '../lib/story.rb'

class StoryTest < Minitest::Test

  def test_it_exitsts
    story = Story.new({
      section: "U.S.",
      subsection: "Politics",
      title: "How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal",
      abstract: "During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help.",
      link: "https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html",
      "byline": "By MIKE McINTIRE, MEGAN TWOHEY and MARK MAZZETTI",
      published: "018-11-29T18:46:27-05:00",
      photo: "some_photo.jpg"
      })

    assert_instance_of Story, story
  end

  def test_it_has_attributes
    story = Story.new({
      section: "U.S.",
      subsection: "Politics",
      title: "How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal",
      abstract: "During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help.",
      link: "https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html",
      published: "2018-11-29T18:46:27-05:00",
      photo: "some_photo.jpg"
      })

    assert_equal "U.S.", story.section
    assert_equal "Politics", story.subsection
    assert_equal "How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal", story.title
    assert_equal "During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help.", story.abstract
    assert_equal "https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html", story.link
    assert_equal "2018-11-29T18:46:27-05:00", story.published
    assert_equal "some_photo.jpg", story.photo
  end

end
