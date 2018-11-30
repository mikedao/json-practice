require 'minitest/autorun'
require 'minitest/pride'
require './lib/story'

class StoryTest < Minitest::Test

  def test_it_exists
    story = Story.new(0, './data/nytimes.json')
    assert_instance_of Story, story
  end

  def test_it_has_attributes
    story = Story.new(0, './data/nytimes.json')
    assert_equal 'U.S.', story.section
    assert_equal 'Politics', story.subsection

    expected_title = "How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal"
    assert_equal expected_title, story.title

    expected_abstract = "During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help."
    assert_equal expected_abstract, story.abstract

    expected_link = "https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html"
    assert_equal expected_link, story.link

    assert_equal "2018-11-29T18:46:27-05:00", story.published

    expected_photo = "https://static01.nyt.com/images/2018/11/30/world/30trumpmoscow-1-print/30trumpmoscow7-articleInline.jpg"
    assert_equal expected_photo, story.photo
  end

  def test_can_return_an_array
    filepath = './data/nytimes.json'
    assert_instance_of Array, Story.process(filepath)
  end

  def test_returned_array_contains_all_stories
    filepath = './data/nytimes.json'

    subject = Story.process(filepath)

    first_title = "How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal"
    second_title = "Trump Denies Business Dealings With Russia. His Former Lawyer Contradicts Him."
    last_title = "To Treat Eating Disorders, It Sometimes Takes Two"
    assert_equal first_title, subject[0].title
    assert_equal second_title, subject[1].title
    assert_equal last_title, subject.last.title
  end

end
