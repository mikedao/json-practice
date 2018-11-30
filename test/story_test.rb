require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/story.rb'

class StoryTest < Minitest::Test
  attr_reader :hash

  def setup
    @hash = Story.results
  end

  def test_it_can_return_all_results
    count = @hash.count
    assert count, 43
  end

  def test_it_can_create_story
    section = @hash.first["section"]
    subsection = @hash.first["section"]
    title = @hash.first["title"]
    abstract = @hash.first["abstract"]
    link = @hash.first["url"]
    published = @hash.first["published_date"]
    photo_hash = @hash.first["multimedia"].find{|i|i["format"] == "Normal"}
    photo = photo_hash["url"]
    
    story = Story.new(section, subsection, title, abstract, link, published, photo)
    assert story.section.class, String
    assert story.section, "U.S."
    assert story.subsection.class, String
    assert story.subsection, "Politics"
    assert story.title.class, String
    assert story.title, "How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal"
    assert story.abstract.class, String
    assert story.abstract, "During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help."
    assert story.link.class, String
    assert story.link, "https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html"
    assert story.published.class, String
    assert story.published, "November 29, 2018"
    assert story.photo.class, String
    assert story.photo, "https://static01.nyt.com/images/2018/11/30/world/30trumpmoscow-1-print/30trumpmoscow7-articleInline.jpg"
  end

  def test_it_can_return_all_stories
    stories = Story.create_stories
    count = stories.count
    assert count, 43
  end


end