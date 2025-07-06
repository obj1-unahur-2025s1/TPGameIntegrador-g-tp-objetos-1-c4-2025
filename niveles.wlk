import sokoban.*
import pantallasYTeclado.* 
import paredesYCajasYMetas.*
import sonido.*

class Nivel{
	const initialGridMap
  const property siguienteNivel = null
  const	property metas = []
  const property cajas = []
  
  method iniciar() {
	self.dibujarMapa()
	teclado.iniciar()
    	keyboard.r().onPressDo({ self.restart() })
		sonido.cargar()
		game.onCollideDo(personaje, {unaCaja=>personaje.empujar(unaCaja)})
  }

	method dibujarMapa() {
    	var y = game.height() - 1 initialGridMap.forEach({fila =>
      	var x = 0 fila.forEach({celda => celda.decode(x, y) x += 1})
      	y -= 1})
  }

    

  method restart() {
		game.clear()
		self.iniciar()
		personaje.position(game.at(1, 2))
	}
    
  method nivelSuperado() {
		if (cajas.all({ caja => caja.estaEnLaMeta() }))
			game.clear()
			pantallaEntreNiveles.cargar()
	}
}

object p {
  method decode(x, y) {
    const pared = new Pared(position = game.at(x, y))
    game.addVisual(pared)
  }
}

object c {
  method decode(x, y) {
    const caja = new Caja(position = game.at(x, y), llegadas = m.metas())
    game.addVisual(caja)
  }
}

object m {
	const property metas = []
  method decode(x, y) {
    const meta = new Meta(position = game.at(x, y))
    game.addVisual(meta)
	metas.add(meta)
  }
}

object j {
  method decode(x, y) {
    personaje.position(game.at(x, y))
    game.addVisual(personaje)
  }
}

object _ {
  method decode(x, y) {}
}

const nivel1 = new Nivel(
	initialGridMap = [
      [p,p,p,p,p,p,p,p],
      [p,p,p,p,_,_,_,p],
      [p,j,c,_,_,p,_,p],
      [p,m,_,c,_,_,m,p],
      [p,p,p,p,p,p,p,p]
    ], siguienteNivel = nivel2
)

const nivel2 = new Nivel( 
	initialGridMap = [
      [p,p,p,p,p,p,p,p],
      [p,m,m,_,_,_,_,p],
      [p,j,c,_,c,_,_,p],
      [p,p,p,p,_,_,p,p],
      [p,p,p,p,p,p,p,p]
    ], siguienteNivel = juegoCompletado
)
