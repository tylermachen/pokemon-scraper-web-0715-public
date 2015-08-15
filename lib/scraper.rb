class Scraper
  SCRAPE_URL = "pokemon_index.html"

  def initialize(db)
    @db = db
    @page = Nokogiri::HTML(open(SCRAPE_URL))
  end

  def scrape
    pokemon_info = @page.css("div.infocard-tall-list span.infocard-tall")
    pokemon_info.each do |value|
      name = value.css("a.ent-name").text
      type = value.css("small.aside a")[0].text
      Pokemon.save(name, type, @db)
    end
  end
end

# this works and inserts all pokemon into the pokemon table in pokemon.db
# Scraper.new(SQLite3::Database.new('db/pokemon.db')).scrape
