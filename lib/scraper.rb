class Scraper
  SCRAPE_URL = "pokemon_index.html"

  def initialize(db)
    @db = db
  end

  def scrape
    @page = Nokogiri::HTML(open(SCRAPE_URL))
    @page.css("div.infocard-tall-list span.infocard-tall").each do |value|
      name = value.css("a.ent-name").text
      type = value.css("small.aside a")[0].text
      Pokemon.save(name, type, @db)
    end
  end
end
