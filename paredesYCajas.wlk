import wollok.game.*
import sokoban.*
class Pared {
	var property position
	method image ()
	method position() = position
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
    method image() 
    method position()=position 
}
class CajaBeige inherits Caja{
    override method image() = "Crate_Beige.png"
}
class CajaNegra inherits Caja {
    override method image() = "Crate_Black.png"
}
class CajaMarron inherits Caja {
    override method image() = "Crate_Brown.png"
}