import wollok.game.*
import niveles.*
import pantallasYTeclado.*
import sonido.*

object juegoSokoban{
  var property nivelActual = nivel1

  method iniciar(){
    game.title("Sokoban")
	game.height(5)
	game.width(8)
	game.cellSize(64)
	//sonido.cargar()
    pantallaInicio.cargar()
  }

  method siguienteNivel(){
    nivelActual = nivel2
    nivelActual.iniciar()
  }

  method nivelCompletado() = nivelActual.cajas().all({c=>c.estaEnLaMeta()})
}

object personaje {
	var property position = game.at(1,2)
	var direccion = derecha
  	var image = "Character4.png"

	method image() = image

  	method empujar(unElemento){
		if (!unElemento.esMovible() and !unElemento.esPisable(self)){
			self.retroceder() //no retrocede
		}else{
			unElemento.mover(direccion)
		}
	}

	method retroceder() {
		position = direccion.opuesto().siguiente(position)
	}
 
	method moverArriba() {
		direccion = arriba
		image = "Character7.png"
		self.avanzar()
	}

	method moverAbajo() {
		direccion = abajo
		image = "Character4.png"
		self.avanzar()
	}

	method moverIzquierda() {
		direccion = izquierda
		image = "Character1.png"
		self.avanzar()
	}

	method moverDerecha() {
		direccion = derecha
		image = "Character2.png"
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
