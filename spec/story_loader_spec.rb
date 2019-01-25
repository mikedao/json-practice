require './lib/storyloader.rb'
describe StoryLoader do
  it 'loads the stories into POROs' do
    stories = StoryLoader.new("./data/nytimes.json")
    news = stories.load
    expect(news.length).to eq(43)
  end
end
