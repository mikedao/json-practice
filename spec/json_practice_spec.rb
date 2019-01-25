require 'JSON'
require_relative "../lib/story.rb"

describe "JSON Practice" do
  context "Parse JSON" do
    it "into ruby" do
      times = JSON.parse(File.read("../data/nytimes.json"))

      result = times["results"].first 
      story = Story.new(result["section"], result["subsection"], result["title"], result["url"], result["published_date"], result["multimedia"].first["url"])

      expect(story.section)      
      expect(story.section).to be_truthy
      expect(story.subsection).to be_truthy
      expect(story.title).to be_truthy
      expect(story.link).to be_truthy
      expect(story.published).to be_truthy
      expect(story.photo).to be_truthy
    end
  end
end
