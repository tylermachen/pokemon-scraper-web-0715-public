class Pokemon
  attr_accessor :name, :id

  def initialize(name, id)
    @name = name
    @id = id
  end

  def self.save(name, type, db)
    q = db.prepare("INSERT INTO pokemon (name, type) VALUES (?, ?);")
    q.bind_params(name, type)
    q.execute
  end

  # this works except for binding the second param and the tests do not
  # insert the db so those would need to be changed
  # not sure how to connect to the db if the test won't insert it as an arg
  # def alter_hp(health, db)
  #   q = db.prepare("UPDATE pokemon SET hp = (?) WHERE name = (?);")
  #   q.bind_params(1, health)
  #   q.bind_params(2, @name)
  #   q.execute
  # end

  # this code works fine and creates a new pokemon instance
  # def self.find(id, db)
  #   q = db.prepare("SELECT name FROM pokemon WHERE id = (?);")
  #   q.bind_params(id)
  #   name = q.execute
  #   Pokemon.new(name, id)
  # end
end
