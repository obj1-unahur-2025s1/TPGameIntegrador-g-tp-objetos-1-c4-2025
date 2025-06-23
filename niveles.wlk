import sokoban.*
import pantallasYTeclado.* 
import paredesYCajasYMetas.*
class Nivel{

  const property siguienteNivel
  const posicionesParedes = []
  const metas = []
  const property cajas = []
  
  method iniciar() {
    game.addVisual(personaje)
	
	teclado.iniciar()
    	keyboard.r().onPressDo({ self.restart() })
	//keyboard.g().onPressDo({self.nivelSuperado(cajas)})
	//Mirar comentario del metodo nivelSuperado(x)

		//	PAREDES
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
		game.onCollideDo(personaje, {unaCaja=>personaje.empujar(unaCaja)})
  }
    

  method restart() {
		game.clear()
		self.iniciar()
		personaje.position(game.at(4, 3))
	}
    
  method dibujar(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}

  //Si gana, esta bien. Si no gana, devuelve la imagen de "Has pasado el nivel" aunque no lo hayas ganado. Cambiar.
  method nivelSuperado(unasCajas) {
		if (unasCajas.all({ caja => caja.estaEnLaMeta() }))
			game.clear()
			pantallaEntreNiveles.cargar()
	}
}


object nivel1 inherits Nivel (siguienteNivel = nivel2){
	//const posicionesParedes = []

    override method iniciar(){
		super()
		game.boardGround("Ground_Concrete.png")

		//paredes propias del nivel
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
	/*
	method nivelSuperado(unasCajas) {
		if (unasCajas.all({ caja => caja.estaEnLaMeta() }))
			game.clear()
			pantallaEntreNiveles.cargar()
	}
	*/
}


object nivel2 inherits Nivel (siguienteNivel = nivel3){ //agregar nivel 3 o pantalla final
	//const posicionesParedesGrises = [ ]

    override method iniciar(){
      super()
	  game.boardGround("GroundGravel_Grass.png")
	  //posicionesParedesGrises.addAll(
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
			//posicionesParedesGrises.forEach({ posiciones => self.dibujar(new ParedGris(position = posiciones)) })
			posicionesParedes.forEach({ posiciones => self.dibujar(new ParedGris(position = posiciones)) })

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
	/*
	method nivelSuperado(unasCajas) {
		if (unasCajas.all({ caja => caja.estaEnLaMeta() }))
			game.clear()
			pantallaEntreNiveles.cargar()
	}
	*/
}
object nivel3 inherits Nivel (siguienteNivel = pantallaFinal) {
	override method iniciar() {
		super()
	}
}
