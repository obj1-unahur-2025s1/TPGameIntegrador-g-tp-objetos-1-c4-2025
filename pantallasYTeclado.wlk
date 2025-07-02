import sonido.*
import niveles.*
import sokoban.*

object pantallaInicio {
  const position = game.origin()
  method image() = "pantallaDeInicio2a.png"
  method position() = position
  method cargar() {
    game.addVisual(self)
    keyboard.enter().onPressDo({game.removeVisual(self)
                                juegoSokoban.nivelActual().iniciar()
                                sonido.reproducir()
                                })
    keyboard.i().onPressDo({instrucciones.cargar()})
    keyboard.b().onPressDo({instrucciones.salir()})
  }

}

object pantallaEntreNiveles {
	method position() = game.origin()
	method image() = "nivelSuperado2.png"
	method cargar() {
		game.addVisual(self)
		keyboard.enter().onPressDo({
									juegoSokoban.siguienteNivel()
                  game.removeVisual(self)})
	}

}


object instrucciones {
  method position() = game.at(2,0)
  method image() = "instrucciones2.png"
  method cargar() {
    game.addVisual(self)
  }
  method salir() {
    game.removeVisual(self)
  }
}
object juegoCompletado {
  method image() = "pantallaFinal2.png"
  method position() = game.origin()
  method iniciar() {
    game.clear()
    sonido.parar()
    game.addVisual(self)
    keyboard.enter().onPressDo({nivel1.iniciar()
                              game.removeVisual(self)})

  }
}

object teclado{
  method iniciar(){ 
    keyboard.up().onPressDo({ personaje.moverArriba() })
		keyboard.down().onPressDo({ personaje.moverAbajo() })
		keyboard.left().onPressDo({ personaje.moverIzquierda() })
		keyboard.right().onPressDo({ personaje.moverDerecha() })
    keyboard.i().onPressDo({instrucciones.cargar()})
    keyboard.b().onPressDo({instrucciones.salir()})
    keyboard.g().onPressDo({if(juegoSokoban.nivelCompletado()) juegoSokoban.nivelActual().nivelSuperado()})
    keyboard.minusKey().onPressDo({ sonido.disminuirVolumen() })
		keyboard.plusKey().onPressDo({ sonido.aumentarVolumen() })

  }
}