require './lib/storyloader.rb'
require 'pry'
describe StoryLoader do
  it 'loads the stories into POROs' do
    story = StoryLoader.new("./data/nytimes.json")
    news = story.load_stories
    expect(news.length).to eq(43)
  end
end
