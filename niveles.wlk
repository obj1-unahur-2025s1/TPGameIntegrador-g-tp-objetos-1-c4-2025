import sokoban.*
import pantallasYTeclado.* 
import paredesYCajasYMetas.*
class Nivel{

  const property siguienteNivel
  //const posicionesParedes = []
  const property metas = []
  const property cajas = []
  //var ancho = 0 
  //var largo = 0
  

  method iniciar() {
    game.addVisual(personaje)
	personaje.position(game.at(4, 3))
	teclado.iniciar()
    keyboard.r().onPressDo({ self.restart() })

	//	PAREDES

/*
	ancho = game.width() - 1
	largo = game.height() - 1

    // borde inferior
	self.borde(0,"inf")
    // borde superior
	self.borde(largo, "sup")
    // borde izq
	self.borde(0, "izq")
    // borde der
	self.borde(ancho, "der")

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
		personaje.position(game.at(4, 3))
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

//Se utilizara (si puedo antes del domingo) matrices tanto en el nivel 1 como en el nivel 2.
//Si despues de realizar los cambios el rendimiento del juego sigue siendo el mismo,
//se acortaran las columnas y filas (ya sea a 20x20 o a 15x15).
//Para compensar esto, probablemente se agreguen mas niveles.

object nivel1 inherits Nivel (siguienteNivel = nivel2){
    override method iniciar(){
		super()
		game.boardGround("Ground_Concrete.png")

		const borde = (0..(game.width() - 1))

		const pared1 = [1,2,3,9,18,24,28]
		const pared2 = [9,22]
		const pared3 = [1,9,19,24]
		const pared4 = [1,2,3,6,8,9,10,11,20,21,22]
		const pared5 = [1,2,3,6,18,25,28]
		const pared6 = [1,2,3,6,7,8,9,10,17,21,22,23]
		const pared7 = [1,6,8,9,10,16,18,25,26,27,28]
		const pared8 = [1,9,10,13,18,23,24,25,26,27,28]
		const pared9 = [1,4,5,6,7,9,10,12,13,14,16,23,24,25,26,27,28]
		const pared10 = [1,5,6,10,12,18,25,26,27,28]
		const pared11 = [2,5,6,7,8,10,14,16,18,19,20,22]
		const pared12 = [1,10,16,17,18,22,25,26]
		const pared13 = [1,5,6,7,8,12,15,16,17,18,21,24,25,26]
		const pared14 = [1,2,3,4,5,6,7,8,10,11,12,21,24]
		const pared15 = [1,2,3,11,12,13,16,21,24,26,28]
		const pared16 = [1,2,3,4,8,9,12,13,14,15,17,18,26]
		const pared17 = [1,2,3,4,5,6,7,8,9,21,23]
		const pared18 = [1,2,3,4,5,7,8,9,13,14,19,24,25,26,27]


		borde.forEach({a => game.addVisual(new ParedBeige (x = 0, y= a))})
    	borde.forEach({a => game.addVisual(new ParedBeige (x = (game.width() - 1), y= a))})
    	borde.forEach({a => game.addVisual(new ParedBeige (x = a, y= 0))})
    	borde.forEach({a => game.addVisual(new ParedBeige (x = a, y= (game.height() - 1)))})

		pared1.forEach({a=> game.addVisual(new ParedBeige(x=a , y=1))})
		pared2.forEach({a=> game.addVisual(new ParedBeige(x=a , y=2))})
		pared3.forEach({a=> game.addVisual(new ParedBeige(x=a , y=3))})
		pared4.forEach({a=> game.addVisual(new ParedBeige(x=a , y=4))})
		pared5.forEach({a=> game.addVisual(new ParedBeige(x=a , y=5))})
		pared6.forEach({a=> game.addVisual(new ParedBeige(x=a , y=6))})
		pared7.forEach({a=> game.addVisual(new ParedBeige(x=a , y=7))})
		pared8.forEach({a=> game.addVisual(new ParedBeige(x=a , y=8))})
		pared9.forEach({a=> game.addVisual(new ParedBeige(x=a , y=9))})
		pared10.forEach({a=> game.addVisual(new ParedBeige(x=a , y=10))})
		pared11.forEach({a=> game.addVisual(new ParedBeige(x=a , y=11))})
		pared12.forEach({a=> game.addVisual(new ParedBeige(x=a , y=12))})
		pared13.forEach({a=> game.addVisual(new ParedBeige(x=a , y=13))})
		pared14.forEach({a=> game.addVisual(new ParedBeige(x=a , y=14))})
		pared15.forEach({a=> game.addVisual(new ParedBeige(x=a , y=15))})
		pared16.forEach({a=> game.addVisual(new ParedBeige(x=a , y=16))})
		pared17.forEach({a=> game.addVisual(new ParedBeige(x=a , y=17))})
		pared18.forEach({a=> game.addVisual(new ParedBeige(x=a , y=18))})

		//paredes propias del nivel
		/*
      	posicionesParedes.addAll(
			[
				new Position(x = 1, y = 1),
				new Position(x = 2, y = 1),
				new Position(x = 3, y = 1),
				new Position(x = 9, y = 1),
				new Position(x = 18, y = 1),
				new Position(x = 24, y = 1),
				new Position(x = 28, y = 1),
				new Position(x = 9, y = 2),
				new Position(x = 22, y = 2),
				new Position(x = 1, y = 3),
				new Position(x = 9, y = 3),
				new Position(x = 19, y = 3),
				new Position(x = 24, y = 3),
				new Position(x = 1, y = 4),
				new Position(x = 2, y = 4),
				new Position(x = 3, y = 4),
				new Position(x = 6, y = 4),
				new Position(x = 8, y = 4),
				new Position(x = 9, y = 4),
				new Position(x = 10, y = 4),
				new Position(x = 11, y = 4),
				new Position(x = 20, y = 4),
				new Position(x = 21, y = 4),
				new Position(x = 22, y = 4),
				new Position(x = 1, y = 5),
				new Position(x = 2, y = 5),
				new Position(x = 3, y = 5),
				new Position(x = 6, y = 5),
				new Position(x = 18, y = 5),
				new Position(x = 25, y = 5),
				new Position(x = 28, y = 5),
				new Position(x = 1, y = 6),
				new Position(x = 2, y = 6),
				new Position(x = 3, y = 6),
				new Position(x = 6, y = 6),
				new Position(x = 7, y = 6),
				new Position(x = 8, y = 6),
				new Position(x = 9, y = 6),
				new Position(x = 10, y = 6),
				new Position(x = 17, y = 6),
				new Position(x = 21, y = 6),
				new Position(x = 22, y = 6),
				new Position(x = 23, y = 6),
				new Position(x = 1, y = 7),
				new Position(x = 6, y = 7),
				new Position(x = 8, y = 7),
				new Position(x = 9, y = 7),
				new Position(x = 10, y = 7),
				new Position(x = 16, y = 7),
				new Position(x = 18, y = 7),
				new Position(x = 25, y = 7),
				new Position(x = 26, y = 7),
				new Position(x = 27, y = 7),
				new Position(x = 28, y = 7),
				new Position(x = 1, y = 8),
				new Position(x = 9, y = 8),
				new Position(x = 10, y = 8),
				new Position(x = 13, y = 8),
				new Position(x = 18, y = 8),
				new Position(x = 23, y = 8),
				new Position(x = 24, y = 8),
				new Position(x = 25, y = 8),
				new Position(x = 26, y = 8),
				new Position(x = 27, y = 8),
				new Position(x = 28, y = 8),
				new Position(x = 1, y = 9),
				new Position(x = 4, y = 9),
				new Position(x = 5, y = 9),
				new Position(x = 6, y = 9),
				new Position(x = 7, y = 9),
				new Position(x = 9, y = 9),
				new Position(x = 10, y = 9),
				new Position(x = 12, y = 9),
				new Position(x = 13, y = 9),
				new Position(x = 14, y = 9),
				new Position(x = 16, y = 9),
				new Position(x = 23, y = 9),
				new Position(x = 24, y = 9),
				new Position(x = 25, y = 9),
				new Position(x = 26, y = 9),
				new Position(x = 27, y = 9),
				new Position(x = 28, y = 9),
				new Position(x = 1, y = 10),
				new Position(x = 5, y = 10),
				new Position(x = 6, y = 10),
				new Position(x = 10, y = 10),
				new Position(x = 12, y = 10),
				new Position(x = 18, y = 10),
				new Position(x = 25, y = 10),
				new Position(x = 26, y = 10),
				new Position(x = 27, y = 10),
				new Position(x = 28, y = 10),
				new Position(x = 1, y = 11),
				new Position(x = 2, y = 11),
				new Position(x = 5, y = 11),
				new Position(x = 6, y = 11),
				new Position(x = 7, y = 11),
				new Position(x = 8, y = 11),
				new Position(x = 10, y = 11),
				new Position(x = 14, y = 11),
				new Position(x = 16, y = 11),
				new Position(x = 18, y = 11),
				new Position(x = 19, y = 11),
				new Position(x = 20, y = 11),
				new Position(x = 22, y = 11),
				new Position(x = 1, y = 12),
				new Position(x = 10, y = 12),
				new Position(x = 16, y = 12),
				new Position(x = 17, y = 12),
				new Position(x = 18, y = 12),
				new Position(x = 22, y = 12),
				new Position(x = 25, y = 12),
				new Position(x = 26, y = 12),
				new Position(x = 1, y = 13),
				new Position(x = 5, y = 13),
				new Position(x = 6, y = 13),
				new Position(x = 7, y = 13),
				new Position(x = 8, y = 13),
				new Position(x = 12, y = 13),
				new Position(x = 15, y = 13),
				new Position(x = 16, y = 13),
				new Position(x = 17, y = 13),
				new Position(x = 18, y = 13),
				new Position(x = 21, y = 13),
				new Position(x = 24, y = 13),
				new Position(x = 25, y = 13),
				new Position(x = 26, y = 13),
				new Position(x = 1, y = 14),
				new Position(x = 2, y = 14),
				new Position(x = 3, y = 14),
				new Position(x = 4, y = 14),
				new Position(x = 5, y = 14),
				new Position(x = 6, y = 14),
				new Position(x = 7, y = 14),
				new Position(x = 8, y = 14),
				new Position(x = 10, y = 14),
				new Position(x = 11, y = 14),
				new Position(x = 12, y = 14),
				new Position(x = 21, y = 14),
				new Position(x = 24, y = 14),
				new Position(x = 1, y = 15),
				new Position(x = 2, y = 15),
				new Position(x = 3, y = 15),
				new Position(x = 11, y = 15),
				new Position(x = 12, y = 15),
				new Position(x = 13, y = 15),
				new Position(x = 16, y = 15),
				new Position(x = 21, y = 15),
				new Position(x = 24, y = 15),
				new Position(x = 26, y = 15),
				new Position(x = 28, y = 15),
				new Position(x = 1, y = 16),
				new Position(x = 2, y = 16),
				new Position(x = 3, y = 16),
				new Position(x = 4, y = 16),
				new Position(x = 8, y = 16),
				new Position(x = 9, y = 16),
				new Position(x = 12, y = 16),
				new Position(x = 13, y = 16),
				new Position(x = 14, y = 16),
				new Position(x = 15, y = 16),
				new Position(x = 16, y = 16),
				new Position(x = 18, y = 16),
				new Position(x = 26, y = 16),
				new Position(x = 1, y = 17),
				new Position(x = 1, y = 17),
				new Position(x = 2, y = 17),
				new Position(x = 3, y = 17),
				new Position(x = 4, y = 17),
				new Position(x = 5, y = 17),
				new Position(x = 6, y = 17),
				new Position(x = 7, y = 17),
				new Position(x = 8, y = 17),
				new Position(x = 9, y = 17),
				new Position(x = 21, y = 17),
				new Position(x = 23, y = 17),
				new Position(x = 1, y = 18),
				new Position(x = 1, y = 18),
				new Position(x = 2, y = 18),
				new Position(x = 3, y = 18),
				new Position(x = 4, y = 18),
				new Position(x = 5, y = 18),
				new Position(x = 6, y = 18),
				new Position(x = 7, y = 18),
				new Position(x = 8, y = 18),
				new Position(x = 9, y = 18),
				new Position(x = 13, y = 18),
				new Position(x = 14, y = 18),
				new Position(x = 19, y = 18),
				new Position(x = 24, y = 18),
				new Position(x = 25, y = 18),
				new Position(x = 26, y = 18),
				new Position(x = 27, y = 18),
				new Position(x = game.width() - 2, y = game.height() - 2)
			]
		)
		posicionesParedes.forEach({ posicionParedes => self.dibujar(new ParedBeige(position = posicionParedes)) })
	*/

		//donde hay que ubicar las cajas
		metas.addAll([new Position(x = 4, y = 15),
			new Position(x = 11, y = 18),
			new Position(x = 17, y = 11),
			new Position(x = 27, y = 17),
			new Position(x = 28, y = 3)
		].map({ posicion => self.dibujar(new MetaVioleta(position = posicion)) }))
			
		//cajas
		cajas.addAll([
			new Position(x = 3, y = 2),
			new Position(x = 18, y = 4),
			new Position(x = 11, y = 9),
			new Position(x = 14, y = 14),
			new Position(x = 27, y = 11)
		].map({ posicion => self.dibujar(new CajaNegra(position = posicion, llegadas = metas)) })) 
    }
	
}


object nivel2 inherits Nivel (siguienteNivel = juegoCompletado){ 
    override method iniciar(){
      super()
	  game.boardGround("GroundGravel_Grass.png")
	  //posicionesParedesGrises.addAll(

		const borde = (0..(game.width() - 1))

		const pared1 = [9,18,24,28]
		const pared2 = [4,7]
		const pared3 = [17,18,19,24]
		const pared4 = [1,2,3,9,11,17,18,19,20,21,22]
		const pared5 = [1,2,3,6,13,18,26,27]
		const pared6 = [4,6,7,9,10,13,14,17,19,22,23]
		const pared7 = [4,8,9,17,18,22,23,25,26,27,29]
		const pared8 = [1,9,10,13,18,23,24,25,26,27,28]
		const pared9 = [1,4,5,6,7,9,10,12,13,14,16,23,24,25,26,27,28]
		const pared10 = [1,5,6,10,12,18,25,26,27,28]
		const pared11 = [1,2,5,6,7,8,10,14,16,18,19,20,22]
		const pared12 = [1,10,16,17,18,22,25,26]
		const pared13 = [1,5,6,7,8,15,16,17,18,21,24,25,26]
		const pared14 = [1,2,3,4,5,6,7,8,10,11,12,21,24]
		const pared15 = [1,2,3,11,12,13,16,21,24,26,28]
		const pared16 = [1,2,3,4,8,9,12,13,14,15,16,18,26]
		const pared17 = [1,2,3,4,5,6,7,8,9,21,23]
		const pared18 = [1,2,3,4,5,6,7,8,9,13,14,19,24,25,26,27]

		
		borde.forEach({a => game.addVisual(new ParedGris (x = 0, y= a))})
    	borde.forEach({a => game.addVisual(new ParedGris (x = (game.width() - 1), y= a))})
    	borde.forEach({a => game.addVisual(new ParedGris (x = a, y= 0))})
    	borde.forEach({a => game.addVisual(new ParedGris (x = a, y= (game.height() - 1)))})

		pared1.forEach({a=> game.addVisual(new ParedGris(x=a , y=1))})
		pared2.forEach({a=> game.addVisual(new ParedGris(x=a , y=2))})
		pared3.forEach({a=> game.addVisual(new ParedGris(x=a , y=3))})
		pared4.forEach({a=> game.addVisual(new ParedGris(x=a , y=4))})
		pared5.forEach({a=> game.addVisual(new ParedGris(x=a , y=5))})
		pared6.forEach({a=> game.addVisual(new ParedGris(x=a , y=6))})
		pared7.forEach({a=> game.addVisual(new ParedGris(x=a , y=7))})
		pared8.forEach({a=> game.addVisual(new ParedGris(x=a , y=8))})
		pared9.forEach({a=> game.addVisual(new ParedGris(x=a , y=9))})
		pared10.forEach({a=> game.addVisual(new ParedGris(x=a , y=10))})
		pared11.forEach({a=> game.addVisual(new ParedGris(x=a , y=11))})
		pared12.forEach({a=> game.addVisual(new ParedGris(x=a , y=12))})
		pared13.forEach({a=> game.addVisual(new ParedGris(x=a , y=13))})
		pared14.forEach({a=> game.addVisual(new ParedGris(x=a , y=14))})
		pared15.forEach({a=> game.addVisual(new ParedGris(x=a , y=15))})
		pared16.forEach({a=> game.addVisual(new ParedGris(x=a , y=16))})
		pared17.forEach({a=> game.addVisual(new ParedGris(x=a , y=17))})
		pared18.forEach({a=> game.addVisual(new ParedGris(x=a , y=18))})


	  /* 
	  posicionesParedes.addAll(
			[
				new Position(x = 9, y = 1),
				new Position(x = 18, y = 1),
				new Position(x = 24, y = 1),
				new Position(x = 28, y = 1),
				new Position(x = 4, y = 2),
				new Position(x = 7, y = 2),
				new Position(x = 9, y = 3),
				new Position(x = 8, y = 3),
				new Position(x = 17, y = 3),
				new Position(x = 18, y = 3),
				new Position(x = 19, y = 3),
				new Position(x = 24, y = 3),
				new Position(x = 1, y = 4),
				new Position(x = 2, y = 4),
				new Position(x = 3, y = 4),
				new Position(x = 9, y = 4),
				new Position(x = 11, y = 4),
				new Position(x = 17, y = 4),
				new Position(x = 18, y = 4),
				new Position(x = 19, y = 4),
				new Position(x = 20, y = 4),
				new Position(x = 21, y = 4),
				new Position(x = 22, y = 4),
				new Position(x = 1, y = 5),
				new Position(x = 2, y = 5),
				new Position(x = 3, y = 5),
				new Position(x = 6, y = 5),
				new Position(x = 13, y = 5),
				new Position(x = 18, y = 5),
				new Position(x = 4, y = 6),
				new Position(x = 6, y = 6),
				new Position(x = 7, y = 6),
				new Position(x = 9, y = 6),
				new Position(x = 10, y = 6),
				new Position(x = 13, y = 6),
				new Position(x = 14, y = 6),
				new Position(x = 17, y = 6),
				new Position(x = 19, y = 6),
				new Position(x = 22, y = 6),
				new Position(x = 23, y = 6),
				new Position(x = 4, y = 7),
				new Position(x = 8, y = 7),
				new Position(x = 9, y = 7),
				new Position(x = 17, y = 7),
				new Position(x = 18, y = 7),
				new Position(x = 22, y = 7),
				new Position(x = 23, y = 7),
				new Position(x = 29, y = 7),
				new Position(x = 25, y = 7),
				new Position(x = 26, y = 7),
				new Position(x = 27, y = 7),
				new Position(x = 1, y = 8),
				new Position(x = 9, y = 8),
				new Position(x = 10, y = 8),
				new Position(x = 13, y = 8),
				new Position(x = 18, y = 8),
				new Position(x = 23, y = 8),
				new Position(x = 24, y = 8),
				new Position(x = 25, y = 8),
				new Position(x = 26, y = 8),
				new Position(x = 27, y = 8),
				new Position(x = 28, y = 8),
				new Position(x = 1, y = 9),
				new Position(x = 4, y = 9),
				new Position(x = 5, y = 9),
				new Position(x = 6, y = 9),
				new Position(x = 7, y = 9),
				new Position(x = 9, y = 9),
				new Position(x = 10, y = 9),
				new Position(x = 12, y = 9),
				new Position(x = 13, y = 9),
				new Position(x = 14, y = 9),
				new Position(x = 16, y = 9),
				new Position(x = 23, y = 9),
				new Position(x = 24, y = 9),
				new Position(x = 25, y = 9),
				new Position(x = 26, y = 9),
				new Position(x = 27, y = 9),
				new Position(x = 28, y = 9),
				new Position(x = 1, y = 10),
				new Position(x = 5, y = 10),
				new Position(x = 6, y = 10),
				new Position(x = 10, y = 10),
				new Position(x = 12, y = 10),
				new Position(x = 18, y = 10),
				new Position(x = 25, y = 10),
				new Position(x = 26, y = 10),
				new Position(x = 27, y = 10),
				new Position(x = 28, y = 10),
				new Position(x = 1, y = 11),
				new Position(x = 2, y = 11),
				new Position(x = 5, y = 11),
				new Position(x = 6, y = 11),
				new Position(x = 7, y = 11),
				new Position(x = 8, y = 11),
				new Position(x = 10, y = 11),
				new Position(x = 14, y = 11),
				new Position(x = 16, y = 11),
				new Position(x = 18, y = 11),
				new Position(x = 19, y = 11),
				new Position(x = 20, y = 11),
				new Position(x = 22, y = 11),
				new Position(x = 1, y = 12),
				new Position(x = 10, y = 12),
				new Position(x = 16, y = 12),
				new Position(x = 17, y = 12),
				new Position(x = 18, y = 12),
				new Position(x = 22, y = 12),
				new Position(x = 25, y = 12),
				new Position(x = 26, y = 12),
				new Position(x = 1, y = 13),
				new Position(x = 5, y = 13),
				new Position(x = 6, y = 13),
				new Position(x = 7, y = 13),
				new Position(x = 8, y = 13),
				new Position(x = 15, y = 13),
				new Position(x = 16, y = 13),
				new Position(x = 17, y = 13),
				new Position(x = 18, y = 13),
				new Position(x = 21, y = 13),
				new Position(x = 24, y = 13),
				new Position(x = 25, y = 13),
				new Position(x = 26, y = 13),
				new Position(x = 1, y = 14),
				new Position(x = 2, y = 14),
				new Position(x = 3, y = 14),
				new Position(x = 4, y = 14),
				new Position(x = 5, y = 14),
				new Position(x = 6, y = 14),
				new Position(x = 7, y = 14),
				new Position(x = 8, y = 14),
				new Position(x = 10, y = 14),
				new Position(x = 11, y = 14),
				new Position(x = 12, y = 14),
				new Position(x = 21, y = 14),
				new Position(x = 24, y = 14),
				new Position(x = 1, y = 15),
				new Position(x = 2, y = 15),
				new Position(x = 3, y = 15),
				new Position(x = 11, y = 15),
				new Position(x = 12, y = 15),
				new Position(x = 13, y = 15),
				new Position(x = 16, y = 15),
				new Position(x = 21, y = 15),
				new Position(x = 24, y = 15),
				new Position(x = 26, y = 15),
				new Position(x = 28, y = 15),
				new Position(x = 1, y = 16),
				new Position(x = 2, y = 16),
				new Position(x = 3, y = 16),
				new Position(x = 4, y = 16),
				new Position(x = 8, y = 16),
				new Position(x = 9, y = 16),
				new Position(x = 12, y = 16),
				new Position(x = 13, y = 16),
				new Position(x = 14, y = 16),
				new Position(x = 15, y = 16),
				new Position(x = 16, y = 16),
				new Position(x = 18, y = 16),
				new Position(x = 26, y = 16),
				new Position(x = 1, y = 17),
				new Position(x = 1, y = 17),
				new Position(x = 2, y = 17),
				new Position(x = 3, y = 17),
				new Position(x = 4, y = 17),
				new Position(x = 5, y = 17),
				new Position(x = 6, y = 17),
				new Position(x = 7, y = 17),
				new Position(x = 8, y = 17),
				new Position(x = 9, y = 17),
				new Position(x = 21, y = 17),
				new Position(x = 23, y = 17),
				new Position(x = 1, y = 18),
				new Position(x = 1, y = 18),
				new Position(x = 2, y = 18),
				new Position(x = 3, y = 18),
				new Position(x = 4, y = 18),
				new Position(x = 5, y = 18),
				new Position(x = 6, y = 18),
				new Position(x = 7, y = 18),
				new Position(x = 8, y = 18),
				new Position(x = 9, y = 18),
				new Position(x = 13, y = 18),
				new Position(x = 14, y = 18),
				new Position(x = 19, y = 18),
				new Position(x = 24, y = 18),
				new Position(x = 25, y = 18),
				new Position(x = 26, y = 18),
				new Position(x = 26, y = 5), 
				new Position(x = 27, y = 5), 
				new Position(x = 27, y = 18),
				new Position(x = game.width() - 2, y = game.height() - 2)
			])

			posicionesParedes.forEach({ posiciones => self.dibujar(new ParedGris(position = posiciones)) })
*/

	//donde hay que ubicar las cajas
		metas.addAll([
			new Position(x = 4, y = 8),
			new Position(x = 10, y = 18),
			new Position(x = 13, y = 10),
			new Position(x = 27, y = 17),
			new Position(x = 27, y = 1)
		].map({ posicion => self.dibujar(new MetaAzul(position = posicion)) }))

		//cajas
		cajas.addAll([
			new Position(x = 4, y = 12),
			new Position(x = 11, y = 9),
			new Position(x = 17, y = 14),
			new Position(x = 20, y = 8),
			new Position(x = 23, y = 13)
		].map({ posicion => self.dibujar(new CajaMarron(position = posicion, llegadas = metas)) }))
    }
	
	override method nivelSuperado() {
		if (cajas.all({ caja => caja.estaEnLaMeta() }))
			game.clear()
			juegoCompletado.cargar()
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
      [p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p],
      [p,p,p,p,p,p,p,p,p,p,v,m,v,p,p,v,v,v,v,p,v,v,v,v,p,p,p,p,p,p],
      [p,p,p,p,p,p,p,p,p,p,v,v,v,v,v,v,v,v,v,v,v,p,v,p,v,v,v,v,v,p],
      [p,p,p,p,p,v,v,v,p,p,v,v,p,p,p,p,p,v,p,v,v,v,v,v,v,v,p,v,v,p],
      [p,p,p,p,m,v,v,v,v,v,v,p,p,p,v,v,p,v,v,v,v,p,v,v,p,v,p,v,p,p],
      [p,p,p,p,p,p,p,p,p,v,p,p,p,v,v,v,v,v,v,v,v,p,v,v,p,v,v,v,v,p],
      [p,p,v,v,v,p,p,p,p,v,v,v,p,v,v,p,p,p,p,v,v,p,v,v,p,p,p,v,v,p],
      [p,p,v,v,v,v,v,v,v,v,p,v,v,v,v,v,p,p,p,v,v,v,p,v,v,p,p,v,v,p],
      [p,p,p,v,v,p,p,p,p,v,p,v,v,v,p,v,p,m,p,p,p,v,p,v,v,v,v,v,v,p],
      [p,p,v,v,v,p,p,v,v,v,p,v,p,v,v,v,v,v,p,v,v,v,v,v,v,p,p,p,p,p],
      [p,p,v,v,p,p,p,p,v,p,p,v,p,p,p,v,p,v,v,v,v,v,v,p,p,p,p,p,p,p],
      [p,p,v,v,v,v,v,v,v,p,p,v,v,p,v,v,v,v,p,v,v,v,v,p,p,p,p,p,p,p],
      [p,p,v,v,v,v,p,v,p,p,p,v,v,v,v,v,p,v,p,v,v,v,v,v,v,p,p,p,p,p],
      [p,p,p,p,v,v,p,p,p,p,p,v,v,v,v,v,v,p,v,v,v,p,p,p,v,v,v,v,v,p],
      [p,p,p,p,v,v,p,v,v,v,v,v,v,v,v,v,v,v,p,v,v,v,v,v,v,p,v,v,p,p],
      [p,p,p,p,v,v,p,v,p,p,p,p,v,v,v,v,v,v,v,v,p,p,p,v,v,v,v,v,v,p],
      [p,p,v,v,v,v,v,v,v,p,v,v,v,v,v,v,v,v,v,p,v,v,v,v,p,v,v,v,m,p],
      [p,v,v,v,v,v,v,v,v,p,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,v,p],
      [p,p,p,p,v,v,v,v,v,p,v,v,v,v,v,v,v,v,p,v,v,v,v,v,p,v,v,v,p,p],
      [p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p,p],
    ]
*/
