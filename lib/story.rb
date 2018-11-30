#code goes here

class Story
  attr_reader :section,
              :subsection,
              :title,
              :abstract,
              :link

  def initialize(hash)
    @hash = hash
    @section              = hash["section"]
    @subsection           = hash["subsection"]
    @title                = hash["title"]
    @abstract             = hash["abstract"]
    @link                 = hash["url"]
    @published_date       = hash["published_date"]

    # --- Not public ---
    @byline               = hash["byline"]
    @item_type            = hash["item_type"]
    @updated_date         = hash["updated_date"]
    @created_date         = hash["created_date"]
    @material_type_facet  = hash["material_type_facet"]
    @kicker               = hash["kicker"]
    @des_facet            = hash["des_facet"]
    @org_facet            = hash["org_facet"]
    @per_facet            = hash["per_facet"]
    @geo_facet            = hash["geo_facet"]
    @multimedia           = hash["multimedia"]
    @short_url            = hash["short_url"]
  end


  def published
    date = Date.parse(@published_date)
    # formatted = date_with_word_month(date)
  end


  def photo
    photo = find_photo_by_format("Normal")
    link  = photo["url"] || "No Photo Available"
  end

  private

  def find_photo_by_format(format)
    @multimedia.find { |hash| hash["format"] == format }
  end

  


end
