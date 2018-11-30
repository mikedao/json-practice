require './lib/story'

class StoryRepoTest < Minitest::Test

  def test_it_exists
    story_repo = StoryRepo.new("data/nytimes.json")

    assert_instance_of StoryRepo, story_repo
  end

end
