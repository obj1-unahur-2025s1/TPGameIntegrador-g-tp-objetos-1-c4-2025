import niveles.*
import sokoban.*

object pantallaInicio {
  const position = game.at(2,2)
  method image() = "pantallaDeInicio2.png"
  method position() = position
  method cargar() {
    game.addVisual(self)
    keyboard.enter().onPressDo({game.removeVisual(self)
                                juegoSokoban.nivelActual().iniciar()})
    keyboard.i().onPressDo({instrucciones.cargar()})
    keyboard.b().onPressDo({instrucciones.salir()})
  }

}

object pantallaEntreNiveles {
	method position() = game.at(2,2)
	method image() = "nivelSuperado.png"
	method cargar() {
		game.addVisual(self)
		keyboard.enter().onPressDo({
									juegoSokoban.siguienteNivel()
                  game.removeVisual(self)})
	}

}


object instrucciones {
  method position() = game.at(7,0)
  method image() = "instruccionesNuevo2.png"
  method cargar() {
    game.addVisual(self)
  }
  method salir() {
    game.removeVisual(self)
  }
}
object juegoCompletado {
  method image() = "pantallaFinal.png"
  method position() = game.at(2,2)
  method iniciar() {
    game.clear()
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
    keyboard.g().onPressDo({if(juegoSokoban.nivelActual().cajas().all({c=>c.estaEnLaMeta()})) juegoSokoban.nivelActual().nivelSuperado()})

  }
}
