# Utilizar el reto de HTTParty, el servicio cambió, ahora tiene dominio: hackapi.jgab.net

# La data que existía en el servicio desapareció y el servicio sufrió modificaciones.

# Registren su usuario de nuevo en el api.

# Único cambio conocido del api: no se usa idenity, 
# se filtra por username y debe ser el de slack.

# NOTA: lean los errores que da el server.!!!, ahí estarán 
# las respuestas que necesitan.

# el resultado del reto saldrá por http://hackapi.jgab.net/api/users/hackers, 
# para que puedan realizar el siguiente reto HTTP al menos 8 tienen que haber culminado el reto.


require 'httparty'

class Reto
  include HTTParty
  base_uri 'http://hackapi.jgab.net/api/users/'

  def agregar(user)
    options = {body: user}
    self.class.post('', options)
  end

  def listar
    self.class.get('')
  end

  def editar(username, user)
    options = {body: user}
    self.class.put('/'+username, options)
  end

  def desactivar(username)
    self.class.delete('/'+username)
  end
end

jamm = Reto.new


print jamm.agregar({
  "address": "Los Dos Caminos", 
  "username": "@codejamm", 
  "fullname": "Jonathan Martinez", 
  "email": "jamm@hack4geeks.co",
  "gender": "male",
  });

print jamm.editar("@codejamm", {"status": "active"});
