import sokoban.*
import pantallasYTeclado.* 
import paredesYCajasYMetas.*
import sonido.*

class Nivel{

  const property siguienteNivel
  //const posicionesParedes = []
  const	property metas = []
  const property cajas = []
  
  method iniciar() {
    game.addVisual(personaje)
	personaje.position(game.at(1, 2))
	teclado.iniciar()
    	keyboard.r().onPressDo({ self.restart() })
		sonido.cargar()

	/*	//	PAREDES
		const ancho = game.width() - 1
		const largo = game.height() - 1

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

	*/
		game.onCollideDo(personaje, {unaCaja=>personaje.empujar(unaCaja)})
  }

  /*
  method borde(numero, bordeAVer){
	if (bordeAVer == "inf" or bordeAVer == "sup"){
		(0 .. ancho).forEach(
			{ n => posicionesParedes.add(new Position(x = n, y = numero)) }
		)
	}
	else {
		(0 .. largo).forEach(
			{ n => posicionesParedes.add(new Position(x = numero, y = n)) }
		)
	}
  }

*/  
    

  method restart() {
		game.clear()
		self.iniciar()
		personaje.position(game.at(1, 2))
	}
    
  method dibujar(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}

 
  method nivelSuperado() {
		if (cajas.all({ caja => caja.estaEnLaMeta() }))
			game.clear()
			pantallaEntreNiveles.cargar()
	}
}


object nivel1 inherits Nivel (siguienteNivel = nivel2){

    override method iniciar(){
		super()
		game.boardGround("Ground_Concrete.png")

		//paredes propias del nivel
		const borde = (0..(game.width() - 1))
		const pared1 = [1,2,3]
		const pared2 = [5]

		borde.forEach({a => game.addVisual(new ParedBeige (x = 0, y= a))})
    	borde.forEach({a => game.addVisual(new ParedBeige (x = (game.width() - 1), y= a))})
    	borde.forEach({a => game.addVisual(new ParedBeige (x = a, y= 0))})
    	borde.forEach({a => game.addVisual(new ParedBeige (x = a, y= (game.height() - 1)))})

		pared1.forEach({a=> game.addVisual(new ParedBeige(x=a , y=3))})
		pared2.forEach({a=> game.addVisual(new ParedBeige(x=a , y=2))})

		/*
      	posicionesParedes.addAll(
			[
				new Position(x = 1, y = 3),
				new Position(x = 2, y = 3),
				new Position(x = 3, y = 3),
				new Position(x = 5, y = 2)
			]
		)
		posicionesParedes.forEach({ posicionParedes => self.dibujar(new ParedBeige(position = posicionParedes)) })
		*/

		//donde hay que ubicar las cajas
		metas.addAll([
			new Position(x = 1, y = 1),
			new Position(x = 6, y = 1)
		].map({ posicion => self.dibujar(new MetaVioleta(position = posicion)) }))

		//cajas
		cajas.addAll([
			new Position(x = 2, y = 2),
			new Position(x = 3, y = 1)
		].map({ posicion => self.dibujar(new CajaNegra(position = posicion, llegadas = metas)) }))
    }

}

object nivel2 inherits Nivel (siguienteNivel = juegoCompletado){
    override method iniciar(){
      super()
	  game.boardGround("GroundGravel_Grass.png")

	  const borde = (0..(game.width() - 1))

	  const pared1 = [1,2,3,6]

	  	borde.forEach({a => game.addVisual(new ParedBeige (x = 0, y= a))})
    	borde.forEach({a => game.addVisual(new ParedBeige (x = (game.width() - 1), y= a))})
    	borde.forEach({a => game.addVisual(new ParedBeige (x = a, y= 0))})
    	borde.forEach({a => game.addVisual(new ParedBeige (x = a, y= (game.height() - 1)))})

		pared1.forEach({a=> game.addVisual(new ParedBeige(x=a , y=1))})

	  //paredes propias del nivel
	  /*
      	posicionesParedes.addAll(
			[
				new Position(x = 1, y = 1),
				new Position(x = 2, y = 1),
				new Position(x = 3, y = 1),
				new Position(x = 6, y = 1)
			]
		)
		posicionesParedes.forEach({ posicionParedes => self.dibujar(new ParedGris(position = posicionParedes)) })
	*/
		//donde hay que ubicar las cajas
		metas.addAll([
			new Position(x = 1, y = 3),
			new Position(x = 2, y = 3)
		].map({ posicion => self.dibujar(new MetaAzul(position = posicion)) }))

		//cajas
		cajas.addAll([
			new Position(x = 2, y = 2),
			new Position(x = 4, y = 2)
		].map({ posicion => self.dibujar(new CajaMarron(position = posicion, llegadas = metas)) }))
    }

	override method nivelSuperado() {
		if (cajas.all({ caja => caja.estaEnLaMeta() }))
			game.clear()
			juegoCompletado.iniciar()
	}
}


/*
Este objeto mapa seria un const en Nivel, asi lo heredan los 2 niveles 

object mapa {
  const property posicionesParedes = []
  const property metas = []
  const property cajas = []
}
*/

/*
	Importante: Esto incluye las paredes laterales,superiores e inferiores. No incluye Cajas. Si incluye metas.

	initialGridMap = [
      [p,p,p,p,p,p,p,p],
      [p,p,p,p,v,v,v,p],
      [p,v,v,v,v,p,v,p],
      [p,m,v,v,v,v,m,p],
      [p,p,p,p,p,p,p,p],
    ]
*/