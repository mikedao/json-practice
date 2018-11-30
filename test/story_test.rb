require 'pry'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/story.rb'

class StoryTest <  Minitest::Test 
	def test_it_exist
		story = Story.new({
			section: "U.S.",
			subsection: "Politics",
			title:	"How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal",
			abstract: "During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help.",
			link: "https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html",
			published: "2018-11-29T18:46:27-05:00",
			photo: "https://static01.nyt.com/images/2018/11/30/world/30trumpmoscow-1-print/30trumpmoscow7-thumbStandard.jpg"
		})

		assert_instance_of Story, story 
	end 

	def test_it_has_sections
		story = Story.new({
			section: "U.S.",
			subsection: "Politics",
			title:	"How a Lawyer, a Felon and a Russian General Chased a Moscow Trump Tower Deal",
			abstract: "During the presidential campaign, Michael D. Cohen and Felix Sater, an associate with a criminal past, pursued a new Trump Tower project with a former spymaster’s help.",
			link: "https://www.nytimes.com/2018/11/29/us/politics/trump-russia-felix-sater-michael-cohen.html",
			published: "2018-11-29T18:46:27-05:00",
			photo: "https://static01.nyt.com/images/2018/11/30/world/30trumpmoscow-1-print/30trumpmoscow7-thumbStandard.jpg"
		})

	end

end 
