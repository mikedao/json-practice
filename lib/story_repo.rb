class StoryRepo

  def initialize(data_file)
    @data_file = data_file
    @stories = stories
  end

  def load_file(file)
    file = File.read(@data_file)
    data_hash = JSON.parse(file)
    data_hash.map do |key, value|
      data_hash["section"] = data_hash["section"].to_i
      data_hash["subsection"] = data_hash["subsection"]
      data_hash["link"] = data_hash["link"]
      data_hash["published"] = data_hash["published"]
      data_hash["photo"] = data_hash["photo"]
      data_hash["title"] = data_hash["title"]
      data_hash["abstract"] = data_hash["abstract"]
      new_story = Story.new(data_hash)
      @stories << new_story
    end
  end

end
