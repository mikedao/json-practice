class JsonLoader
  attr_reader :file_path

  def self.load_articles(file_path)
    file = File.read(file_path)
    json_hash = JSON.parse(file)
    Story.new(json_hash)
  end
end
