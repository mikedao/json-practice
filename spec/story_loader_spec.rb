require './lib/storyloader.rb'
require 'pry'
describe StoryLoader do
  it 'loads the stories into POROs' do
    story = StoryLoader.new("./data/nytimes.json")
    news = story.load_stories
    expect(news.length).to eq(43)
  end
  it "can access a story and it's values" do
    story = StoryLoader.new("./data/nytimes.json")
    news = story.load_stories
    a_story = news[0]
    expect(a_story.section).to eq("U.S.")
    expect(a_story.subsection).to eq("Politics")
    expect(a_story.title).to eq("How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal")
    expect(a_story.abstract).to eq("During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help.")
    expect(a_story.link).to eq("https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html")
    expect(a_story.published).to eq("November 29, 2018")
    expect(a_story.photo).to eq("https://static01.nyt.com/images/2018/11/30/world/30trumpmoscow-1-print/30trumpmoscow7-articleInline.jpg")
  end
end
