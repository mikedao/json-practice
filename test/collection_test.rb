require './test/test_helper'
require_relative '../lib/story.rb'
require_relative '../lib/collection.rb'

class CollectionTest < Minitest::Test

  def test_it_exitsts
    collection = Collection.new()

    assert_instance_of Collection, collection
  end

  def test_it_has_no_stories_to_start
    collection = Collection.new()

    assert_equal collection.stories, []
  end

  def test_it_can_load_json_data
    collection = Collection.new()

    collection.load_data

    assert_equal collection.stories.count, 43
    assert_instance_of Story, collection.stories.first
  end

  def test_it_can_find_pic_or_return_none_available
    collection = Collection.new()

    collection.load_data

    photo_1 = collection.stories.first.photo
    photo_2 = collection.stories[1].photo

    assert_equal photo_1, "https://static01.nyt.com/images/2018/11/30/world/30trumpmoscow-1-print/30trumpmoscow7-articleInline.jpg"

    assert_equal photo_2, "No Photo Available"
  end
end
