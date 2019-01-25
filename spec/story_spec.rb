require './lib/story.rb'

describe Story do
  it 'exists' do
    data = {
      section: "one",
      subsection: "two",
      title: "three",
      abstract: "four",
      link: "alink",
      published: "today's date",
      photo: "alink"
    }
    story = Story.new(data)

    expect(story).to be_an_instance_of Story
  end
end
