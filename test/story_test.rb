require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/story'

class StoryTest < Minitest::Test

  def test_it_exists
    new_article = { section: "U.S.",
      subsection: "Politics",
      title: "How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal",
      abstract: "During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help.",
      link: "https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html",
      published: "2018-11-29T18:46:27-05:00",
      photo: "https://static01.nyt.com/images/2018/11/30/us/politics/30dc-factcheck/merlin_147477981_80cf7251-5c79-4caa-a198-32c4ea269b77-articleInline.jpg"
    }
    story_1 = Story.new(new_article)
    assert_instance_of Story, story_1
  end

  def test_it_has_attributes
    new_article = { section: "U.S.",
      subsection: "Politics",
      title: "How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal",
      abstract: "During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help.",
      link: "https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html",
      published: "November 29, 2018",
      photo: "https://static01.nyt.com/images/2018/11/30/us/politics/30dc-factcheck/merlin_147477981_80cf7251-5c79-4caa-a198-32c4ea269b77-articleInline.jpg"
    }
    story_1 = Story.new(new_article)

    assert_equal "U.S.", story_1.section
    assert_equal "Politics", story_1.subsection
    assert_equal "How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal", story_1.title
    assert_equal "During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help.", story_1.abstract
    assert_equal "https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html", story_1.link
    assert_equal "November 29, 2018", story_1.published
    assert_equal "https://static01.nyt.com/images/2018/11/30/us/politics/30dc-factcheck/merlin_147477981_80cf7251-5c79-4caa-a198-32c4ea269b77-articleInline.jpg", story_1.photo
  end

  def test_create_all_method_returns_array_of_articles_as_hashes
    stories = Story.create_array
    assert_equal(stories.count, 43)
  end

end
