import niveles.*
import sokoban.*

object pantallaInicio {
  const position = game.at(0,0)
  method image() = "pantallaDeInicio.png"
  method position() = position
  method cargar() {
    game.addVisual(self)
    keyboard.enter().onPressDo({game.removeVisual(self)
                                nivel1.iniciar()})
  }

}

object teclado{
  method iniciar(){ 
    keyboard.up().onPressDo({ personaje.moverArriba() })
		keyboard.down().onPressDo({ personaje.moverAbajo() })
		keyboard.left().onPressDo({ personaje.moverIzquierda() })
		keyboard.right().onPressDo({ personaje.moverDerecha() })
  }
}