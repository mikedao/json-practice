require 'minitest/autorun'
require 'minitest/pride'
require './lib/story'

class StoryTest < Minitest::Test

  def test_it_exists
    file = File.read('./data/nytimes.json')
    json = JSON.parse(file)
    results = json["results"]

    story = Story.new(results)
    assert_instance_of Story, story
  end

  def test_it_has_attributes
    file = File.read('./data/nytimes.json')
    json = JSON.parse(file)
    result = json["results"][0]

    story = Story.new(result)
    assert_equal story.section, "U.S."
    assert_equal story.subsection, "Politics"
    assert_equal story.title, "How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal"
    assert_equal story.abstract, "During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help."
    assert_equal story.link, "https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html"
    assert_equal story.published, "2018-11-29T18:46:27-05:00"
    assert_equal story.photo, "https://static01.nyt.com/images/2018/11/30/world/30trumpmoscow-1-print/30trumpmoscow7-articleInline.jpg"
  end


end
