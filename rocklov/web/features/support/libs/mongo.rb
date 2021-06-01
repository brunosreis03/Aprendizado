require "mongo"

Mongo::Logger.logger = Logger.new("./logs/mongo.log") #Move o log do banco de dados pra pasta logs ao invés de aparecer no cucumber

class MongoDB
  attr_accessor :users, :equipos

  def initialize
    client = Mongo::Client.new(CONFIG["mongo"])
    @users = client[:users]
    @equipos = client[:equipos]
  end

  def remove_user(email)
    @users.delete_many({ email: email })
  end

  def get_user(email)
    user = @users.find({ email: email }).first
    return user[:_id]
  end

  def remove_equipo(name, email)
    user_id = get_user(email)
    @equipos.delete_many({ name: name })
  end
end
