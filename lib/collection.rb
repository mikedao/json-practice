require 'json'
require_relative '../lib/story.rb'

class Collection
  attr_reader :stories

  def initialize
    @stories = []
  end

  def load_json
    file = File.read('data/nytimes.json')
    hash_data = JSON.parse(file)['results']

    hash_data.each do |story|
      hash = story.inject({}){|pair,(key,value)| pair[key.to_sym] = value; pair}
      @stories << Story.new(hash)
    end
  end

end
