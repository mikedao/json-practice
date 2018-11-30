require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/story.rb'
require_relative '../lib/story_repo.rb'


class StoryRepoTest < Minitest::Test

  def test_it_exists
    story_repo = StoryRepo.new("data/nytimes.json")

    assert_instance_of StoryRepo, story_repo
  end

  def test_it_creates_stories
    story_repo = StoryRepo.new("data/nytimes.json")
    story_repo.load_file("data/nytimes.json")

    assert_equal story_repo.stories.count, 10
  end

end
