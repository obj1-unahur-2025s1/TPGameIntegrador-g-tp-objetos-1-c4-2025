import sokoban.*
import inicioYTeclado.* 

class Nivel{
    const property siguienteNivel

    method iniciar() {
        game.addVisual(personaje)
	    teclado.iniciar()
        keyboard.r().onPressDo({ self.restart() })
    }

    method restart() {
		game.clear()
		self.iniciar()
	}
    
}


const nivel1 = new Nivel ( 
    siguienteNivel = nivel2 

)

const nivel2 = new Nivel(
    siguienteNivel = nivel1 //agregar nivel 3 o pantalla final
)