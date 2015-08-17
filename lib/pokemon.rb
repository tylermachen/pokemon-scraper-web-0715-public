class Pokemon
  attr_reader :name, :id

  def initialize(name, id, db)
    @name = name
    @id = id
    @db = db
  end

  def alter_hp(health)
    sql = "UPDATE pokemon SET hp = ? WHERE name = ?"
    @db.execute(sql, health, @name)
  end

  def self.save(name, type, db)
    sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = "SELECT name FROM pokemon WHERE id = ?"
    name = db.execute(sql, id).first
    Pokemon.new(name, id, db)
  end
end
