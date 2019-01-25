require './lib/story'
require 'pry'

raw_json = File.read('./data/nytimes.json')
json = JSON.parse(raw_json)
story_array = Story.parse_json(json)

# binding.pry