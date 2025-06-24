class Animacion {
    const frame1

    const frame2

    var imagenActual = frame1

    method image() = imagenActual

    method siguienteImage() {
		if (imagenActual == frame1) {
		    imagenActual = frame2
		}
		else {
			imagenActual = frame1
		}
	}
}
object frameDerecha inherits Animacion(frame1 = "Character2.png", frame2 = "Character3.png") {}

object frameIzquierda inherits Animacion(frame1 = "Character1.png", frame2 = "Character10.png") {}

object frameArriba inherits Animacion(frame1 = "Character7.png", frame2 = "Character8.png") {}

object frameAbajo inherits Animacion(frame1 = "Character4.png", frame2 = "Character5.png") {}

object sonido {
	const sonidoDeFondo = game.sound("sonidoDeFondo.mp3")

	method cargar() {
		sonidoDeFondo.shouldLoop(true)
		keyboard.plusKey().onPressDo({self.aumentarVolumen()})
  		keyboard.minusKey().onPressDo({self.disminuirVolumen()})
		sonidoDeFondo.volume(1)
	}

	method aumentarVolumen() {
		sonidoDeFondo.volume(1.min(sonidoDeFondo.volume() + 0.1))
	}

	method disminuirVolumen() {
		sonidoDeFondo.volume(0.max(sonidoDeFondo.volume() - 0.1))
	}

	method reproducir() {
		sonidoDeFondo.play()
	}

	method parar() {
		sonidoDeFondo.stop()
	}
}