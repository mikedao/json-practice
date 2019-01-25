require 'rspec'
require 'time'
require './lib/story'

describe Story, type: :model do
  it 'initializes a single story' do
    attr = {
     section: "U.S.",
     subsection: "Politics",
     title: "How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal",
     abstract: "During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help.",
     link: "https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html",
     published: "November 29, 2018",
     photo: "https://static01.nyt.com/images/2018/11/30/world/30trumpmoscow-1-print/30trumpmoscow7-thumbStandard.jpg"
   }

    story = Story.new(attr)

    expect(story.section).to eq(attr[:section])
    expect(story.subsection).to eq(attr[:subsection])
    expect(story.title).to eq(attr[:title])
    expect(story.abstract).to eq(attr[:abstract])
    expect(story.link).to eq(attr[:link])
    expect(story.published).to eq(attr[:published])
    expect(story.photo).to eq(attr[:photo])
  end

  it 'returns array given JSON' do
    data = JSON.parse(File.read('./data/nytimes.json'))["results"]
    stories = Story.from_json('./data/nytimes.json')

    data.each_with_index do |story, i|
      expect(stories[i].section).to eq(story["section"])
      expect(stories[i].subsection).to eq(story["subsection"])
      expect(stories[i].title).to eq(story["title"])
      expect(stories[i].abstract).to eq(story["abstract"])
      expect(stories[i].link).to eq(story["url"])
      expect(stories[i].published).to eq(
        Time.parse(story["published_date"]).strftime('%B %d, %Y')
      )
      url = story["multimedia"].select{|media| media["format"] == "Standard Thumbnail"}[0]["url"]
      expect(stories[i].photo).to eq(url).or(eq("No Photo Available"))
    end
  end
end
