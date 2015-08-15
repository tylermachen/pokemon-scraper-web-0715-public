class Pokemon
  attr_accessor :name, :id

  def initialize(name, id, db)
    @name = name
    @id = id
    @db = db
  end

  def alter_hp(health)
    q = @db.prepare("UPDATE pokemon SET hp = (?) WHERE name = (?);")
    q.bind_params(health, @name)
    q.execute
  end

  def self.save(name, type, db)
    q = db.prepare("INSERT INTO pokemon (name, type) VALUES (?, ?);")
    q.bind_params(name, type)
    q.execute
  end

  def self.find(id, db)
    q = db.prepare("SELECT name FROM pokemon WHERE id = (?);")
    q.bind_params(id)
    name = q.execute.first
    Pokemon.new(name, id, db)
  end
end
