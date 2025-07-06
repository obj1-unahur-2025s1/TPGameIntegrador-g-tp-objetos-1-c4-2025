import niveles.*
import wollok.game.*
import sokoban.*

//PAREDES
class Pared {
	var property position
	method image () = "Wall_Beige.png"
	method mover(direccion) {}
	//Colision
  	method esPisable(_) = false
	method esMovible() = false
}

//CAJAS
class Caja {
    var property position 
	const property llegadas

    method image() = if (self.estaEnLaMeta()) "CrateDark_Black.png" else "Crate_Black.png"
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


//METAS
class Meta {
	const property position
	method mover(direccion) {  }
	method esPisable(_) = true
	method image() = "EndPoint_Blue.png"
	method esMovible() = false
}
