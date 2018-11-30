#code goes here
require 'json'
require 'pry'

class Story
  attr_reader :hash

  def initialize(file)
    @hash = JSON.parse(file)
  end

  # def self.section
  #   @hash[:result][:story]
  # end

end
