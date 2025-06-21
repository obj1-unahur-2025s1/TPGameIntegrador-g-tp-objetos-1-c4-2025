import sokoban.*
import inicioYTeclado.* 
import paredesYCajas.*
class Nivel{
  const property siguienteNivel

  method iniciar() {
    game.addVisual(personaje)
	teclado.iniciar()
    keyboard.r().onPressDo({ self.restart() })

		//	PAREDES
		const ancho = game.width() - 1
		const largo = game.height() - 1
		
		const posicionesParedes = []

    // borde inferior
		(0 .. ancho).forEach(
			{ n => posicionesParedes.add(new Position(x = n, y = 0)) }
		)

    // borde superior
    	(0 .. ancho).forEach(
			{ n => posicionesParedes.add(new Position(x = n, y = largo)) }
		)

		// borde izq
		(0 .. largo).forEach(
			{ n => posicionesParedes.add(new Position(x = 0, y = n)) }
		)
		
    // borde der
		(0 .. largo).forEach(
			{ n => posicionesParedes.add(new Position(x = ancho, y = n)) }
		)

		posicionesParedes.forEach({ posicionParedes => self.dibujar(new ParedBeige(position = posicionParedes)) })
  }
    

  method restart() {
		game.clear()
		self.iniciar()
	}
    
  method dibujar(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}
    
}


object nivel1 inherits Nivel (siguienteNivel = nivel2){
	const posicionesParedes = []
    override method iniciar(){
		super()

		//paredes propias del nivel
      	posicionesParedes.addAll(
			[
				new Position(x = 3, y = 5),
				new Position(x = 4, y = 5),
				new Position(x = 5, y = 5)
			]
		)

		posicionesParedes.forEach({ posicionParedes => self.dibujar(new ParedBeige(position = posicionParedes)) })
    }

}

object nivel2 inherits Nivel (siguienteNivel = nivel1){ //agregar nivel 3 o pantalla final
    override method iniciar(){
      super()
    }

}
