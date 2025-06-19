import wollok.game.*
import niveles.*
import inicioYTeclado.*

object juegoSokoban{
  var property nivelActual = nivel1

  method iniciar(){
    game.title("Sokoban")
	game.height(20)
	game.width(30)
	game.boardGround("Ground_Concrete.png")
    pantallaInicio.cargar()
  }

  method siguienteNivel(){
    nivelActual = nivelActual.siguienteNivel()
    nivelActual.iniciar()
  }
}

object personaje {
	var property position = game.at(4, 3)
	var direccion = derecha
  	var image = "Character5.png"

	method image() = image


  	method empujar(unElemento){
    	unElemento.mover()
  	}

	method retroceder() {
		position = direccion.opuesto().siguiente(position)
	}
 
	method moverArriba() {
		direccion = arriba
    	image = "Character8.png"
		self.avanzar()
	}

	method moverAbajo() {
		direccion = abajo
    	image = "Character6.png"
		self.avanzar()
	}

	method moverIzquierda() {
		direccion = izquierda
    	image = "Character10.png"
		self.avanzar()
	}

	method moverDerecha() {
		direccion = derecha
    	image = "Character3.png"
		self.avanzar()
	}
	
	method avanzar() {
		position = direccion.siguiente(position)
	}
	
	method setDireccion(unaDireccion) {
		direccion = unaDireccion
	}
	

}


class Direccion {
	method siguiente(position)
}

object izquierda inherits Direccion { 
	override method siguiente(position) = position.left(1) 
	method opuesto() = derecha
}

object derecha inherits Direccion { 
	override method siguiente(position) = position.right(1) 
	method opuesto() = izquierda
}

object abajo inherits Direccion { 
	override method siguiente(position) = position.down(1) 
	method opuesto() = arriba
}

object arriba inherits Direccion { 
	override method siguiente(position) = position.up(1) 
	method opuesto() = abajo
}