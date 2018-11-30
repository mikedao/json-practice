require 'pry'
require 'json'

class Story 
	def initialize(cont)
		@section = cont[:section]
		@subsection = cont[:subsection]
		@title = cont[:title]
		@abstract = cont[:abstract]
		@link = cont[:link]
		@published = cont[:published]
		@photo = cont[:photo]
	end
	
	def create_cont
		file = File.read('./data/nytimes.json')
		data_params = JSON.parse(file)["results"]

		data_params.map do |data|
			if data_params["multimedia"][2][:format] == "normal"
				section: data["section"]
				subsection: data["subsection"]
				title: data["title"]
				abstract: data["abstract"]
				link: data["url"]
				pulished: data["published_data"]
				photo: data["multimedia"][2]["url"]
			end 
		end 
	end 



end 
