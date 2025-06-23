import niveles.*
import wollok.game.*
import sokoban.*
class Pared {
	var property position
	method image ()
	method position() = position
	method mover(direccion) {
		self.error("No podes mover las paredes")
	}
	//Colision
  	method esPisable(_) = false
	
}

class ParedNegra inherits Pared {
	override method image() = "Wall_Black.png"
}
class ParedBeige inherits Pared {
	override method image() = "Wall_Beige.png"
}
class ParedGris inherits Pared {
	override method image() = "Wall_Gray.png"
}
class ParedMarron inherits Pared {
	override method image() = "Wall_Brown.png"
}

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
		const lugarLibre = game.getObjectsIn(posAlLado).all({ obj => obj.esPisable(self)}
		)
		if (not lugarLibre) {
			self.error("Algo traba la caja.")
		}
} 
	method esPisable(_) = false

	method estaEnLaMeta() = llegadas.any({ llegada => llegada.position() == position })
}
class CajaBeige inherits Caja{
    override method image() = "Crate_Beige.png"
	
}
class CajaNegra inherits Caja {
    override method image() = if (self.estaEnLaMeta()) "CrateDark_Black.png" else "Crate_Black.png"

}
class CajaMarron inherits Caja {
    override method image() = "Crate_Brown.png"
}

class Meta {
	const property position
	method mover(direccion) {  }
	method esPisable(_) = true
	method image()
}
class MetaAzul inherits Meta{
    override method image() = "EndPoint_Blue.png"
}

class MetaBeige inherits Meta{
    override method image() = "EndPoint_Beige.png"
}

class MetaNegra inherits Meta{
    override method image() = "EndPoint_Black.png"
}

class MetaMarron inherits Meta{
    override method image() = "EndPoint_Brown.png"
}

class MetaGris inherits Meta{
    override method image() = "EndPoint_Gray.png"
}

class MetaVioleta inherits Meta{
    override method image() = "EndPoint_Purple.png"
}

class MetaRoja inherits Meta{
    override method image() = "EndPoint_Red.png"
}

class MetaAmarilla inherits Meta{
    override method image() = "EndPoint_Yellow.png"
}