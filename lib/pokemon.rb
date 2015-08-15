class Pokemon
  # def alter_hp(health)
  #   q = db.prepare("UPDATE pokemon SET hp = (?);")
  #   q.bind_params(health)
  #   q.execute
  # end

  def self.save(name, type, db)
    q = db.prepare("INSERT INTO pokemon (name, type) VALUES (?, ?);")
    q.bind_params(name, type)
    q.execute
  end

  def self.find(id, db)
    q = db.prepare("SELECT name FROM pokemon WHERE id = (?);")
    q.bind_params(id)
    q.execute
  end
end
