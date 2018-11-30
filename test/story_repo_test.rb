require 'minitest/autorun'
require 'minitest/pride'

require 'pry'

require 'json'

require "./lib/story_repo"
require "./lib/story"


class StoryRepoTest < Minitest::Test

  attr_reader :hash
  def setup
    # file = "./data/nytimes.json"
    file = File.read("./data/nytimes.json")
    data = JSON.parse(file)
    @results       = data["results"]
    # @results_count = @hash["num_results"]
    @story_count   = @results.count
    # @repo          = StoryRepo.new
    # @stories       = @repo.add_story_collection(@results)
  end

  def test_it_creates_an_empty_repo_array
    repo = StoryRepo.new
    assert_equal repo.stories, []
  end

  def test_it_can_add_a_single_story_to_the_repo
    hash = @results.first
    repo = StoryRepo.new
    repo.add_story(hash)
    assert_equal repo.stories.count, 1
  end

  def test_it_can_add_a_collection_of_stories_to_the_repo
    repo = StoryRepo.new
    repo.add_story_collection(@results)
    assert_equal repo.stories.count, @story_count
    # assert_instance_of repo.stories.first.class, Story
  end

end
