require "mongo"

Mongo::Logger.logger = Logger.new("./logs/mongo.log") #Move o log do banco de dados pra pasta logs ao invés de aparecer no cucumber

class MongoDB
  attr_accessor :users, :equipos

  def initialize
    client = Mongo::Client.new("mongodb://rocklov-db:27017/rocklov")
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

  def remove_equipo(name, user_id)
    obj_id = BSON::ObjectId.from_string(user_id) #módulo do mongodb q converte para o tipo q o banco de dados aceita
    @equipos.delete_many({ name: name, user: obj_id })
  end

  def get_mongo_id
    return BSON::ObjectId.new #cria um object id aleatorio no formato do mongodb
  end
end
