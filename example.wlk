import wollok.game.*
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
object nivel1 {
  method iniciar() {

  }
}