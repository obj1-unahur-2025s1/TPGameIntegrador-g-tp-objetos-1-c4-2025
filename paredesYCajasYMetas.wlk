import niveles.*
import wollok.game.*
import sokoban.*

//PAREDES
class Pared {
	//var property position
	var property x
	var property y 

	var property position = game.at(x,y)
	method image ()
	
	//method position() = position
	method mover(direccion) {}
	//Colision
  	method esPisable(_) = false
	method esMovible() = false
}

class ParedBeige inherits Pared {
	override method image() = "Wall_Beige.png"
}
class ParedGris inherits Pared {
	override method image() = "Wall_Gray.png"
}


//CAJAS
class Caja {
    var property position 
	const property llegadas

    method image() 
    method position() = position
	method mover(direccion) {
		self.validarLugarLibre(direccion)
		position = direccion.siguiente(position)
	}

	method validarLugarLibre(direccion) {
		const posAlLado = direccion.siguiente(position)
		const lugarLibre = game.getObjectsIn(posAlLado).all({ obj => obj.esPisable(self)} //Devuelve todos los objetos en la posición dada.
		)
		if (!lugarLibre) {
			game.say(personaje,"no se puede avanzar hay pared")
			throw new Exception(message = "no se puede avanzar hay pared")
		}
} 
	method esPisable(_) = false
	method esMovible() = true

	method estaEnLaMeta() = llegadas.any({ llegada => llegada.position() == position })
}


class CajaNegra inherits Caja {
    override method image() = if (self.estaEnLaMeta()) "CrateDark_Black.png" else "Crate_Black.png"
}

class CajaMarron inherits Caja {
    override method image() = if(self.estaEnLaMeta()) "CrateDark_Brown.png" else "Crate_Brown.png"
}


//METAS
class Meta {
	const property position
	method mover(direccion) {  }
	method esPisable(_) = true
	method image()
	method esMovible() = false
}


class MetaAzul inherits Meta{
    override method image() = "EndPoint_Blue.png"
}

class MetaVioleta inherits Meta{
    override method image() = "EndPoint_Purple.png"
}
