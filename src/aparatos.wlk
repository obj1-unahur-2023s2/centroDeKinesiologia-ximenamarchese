import pacientes.*

class Aparato {
	var property color = "blanco"
}

class Magneto inherits Aparato {
	var puntosDeImantacion = 800 
	
	method puedeSerUsado(paciente) = true
	method serUsado(paciente) {
		paciente.nivelDeDolor(paciente.nivelDeDolor() * 0.1) 
		puntosDeImantacion -= 1
	}
	method necesitaMantenimiento() = puntosDeImantacion < 100
	method hacerMantenimiento() {
		800.min(puntosDeImantacion += 500)
	}
	
}

class Bicicleta inherits Aparato {
	var cantidadDeVecesQueSeDesajustanLosTornillos = 0 
	var cantidadDeVecesQuePierdeAceite = 0
	
	method puedeSerUsado(paciente) = paciente.edad() > 8
	method serUsado(paciente) {
		if (paciente.nivelDeDolor() > 30 and (paciente.edad() > 30 and paciente.edad() < 50)){
			cantidadDeVecesQueSeDesajustanLosTornillos += 1
			cantidadDeVecesQuePierdeAceite += 1
		}
		else if (paciente.nivelDeDolor() > 30){
			cantidadDeVecesQueSeDesajustanLosTornillos += 1
		}
		paciente.nivelDeDolor(4) 
		paciente.fortalezaMuscular(3)
	}
	method necesitaMantenimiento() = cantidadDeVecesQueSeDesajustanLosTornillos >= 10 or cantidadDeVecesQuePierdeAceite >= 5
	method hacerMantenimiento(){
		cantidadDeVecesQueSeDesajustanLosTornillos = 0 
		cantidadDeVecesQuePierdeAceite = 0
	}
}

class Minitramp inherits Aparato {
	method puedeSerUsado(paciente) = paciente.nivelDeDolor() < 20
	method serUsado(paciente) {
		paciente.fortalezaMuscular(paciente.fortalezaMuscular() * 0.1)
	}
	method necesitaMantenimiento() = false
	method hacerMantenimiento() {}
}