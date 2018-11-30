require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/collection.rb'

class CollectionTest < Minitest::Test
  def setup
    @collection = Collection.new
  end

  def test_if_exist

    assert_instance_of Collection , @collection
  end

  def test_if_it_has_stories
    @collection.load_json

    assert 43, @collection.stories.count
  end
end
