require './lib/story'

stories = Story.create_stories

puts "#{stories.count} stories created!"
puts "Titles: "
stories.each { |story| puts story.title }