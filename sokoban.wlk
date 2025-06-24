import wollok.game.*
import niveles.*
import pantallasYTeclado.*
import animacionYSonido.*

object juegoSokoban{
  var property nivelActual = nivel1

  method iniciar(){
    game.title("Sokoban")
	game.height(20)
	game.width(30)
	game.cellSize(64)
	sonido.cargar()
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
  	var image = "Character4.png"

	method image() = image

	method siguienteFrame() {
		direccion.siguienteFrame()
		image = direccion.imagen()
	}

  	method empujar(unElemento){
    	try
			unElemento.mover(direccion)
		catch e {
			self.retroceder()
			throw e
		}
  	}

	method retroceder() {
		position = direccion.opuesto().siguiente(position)
	}
 
	method moverArriba() {
		direccion = arriba
		self.avanzar()
	}

	method moverAbajo() {
		direccion = abajo
		self.avanzar()
	}

	method moverIzquierda() {
		direccion = izquierda
		self.avanzar()
	}

	method moverDerecha() {
		direccion = derecha
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
	method imagen()
	method siguienteFrame()
}

object izquierda inherits Direccion { 
	override method siguiente(position) = position.left(1) 
	method opuesto() = derecha
	override method imagen() = frameIzquierda.image()
	override method siguienteFrame() {
		frameIzquierda.siguienteImage()
	}
}

object derecha inherits Direccion { 
	override method siguiente(position) = position.right(1) 
	method opuesto() = izquierda
	override method imagen() = frameDerecha.image()
	override method siguienteFrame() {
		frameDerecha.siguienteImage()
	}
}

object abajo inherits Direccion { 
	override method siguiente(position) = position.down(1) 
	method opuesto() = arriba
	override method imagen() = frameAbajo.image()
	override method siguienteFrame() {
		frameAbajo.siguienteImage()
	}
}

object arriba inherits Direccion { 
	override method siguiente(position) = position.up(1) 
	method opuesto() = abajo
	override method imagen() = frameArriba.image()
	override method siguienteFrame() {
		frameArriba.siguienteImage()
	}
}

