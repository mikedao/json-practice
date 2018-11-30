#code goes here
require 'json'

class Story
  def create_all
    file = File.read('./data/nytimes.json')
    JSON.parse(file)
  end

  def section(story_number)
    stories = create_all
    stories['results'][story_number - 1]['section']
  end

  def subsection(story_number)
    stories = create_all
    stories['results'][story_number - 1]['subsection']
  end

  def title(story_number)
    stories = create_all
    stories['results'][story_number - 1]['title']
  end

  def abstract(story_number)
    stories = create_all
    stories['results'][story_number - 1]['abstract']
  end

  def link(story_number)
    stories = create_all
    stories['results'][story_number - 1]['url']
  end

  def published(story_number)
    stories = create_all
    stories['results'][story_number - 1]['published_date']
  end

  def photo(story_number)
    stories = create_all
    stories['results'][story_number - 1]['multimedia'][2]['url']
  end
end
