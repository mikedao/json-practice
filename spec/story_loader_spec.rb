require './lib/storyloader.rb'
describe StoryLoader do
  it 'loads the stories into POROs' do
    stories = StoryLoader.new("nytimes.json")
    expect(stories.length).to eq(43)
  end
end
