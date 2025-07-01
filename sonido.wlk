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