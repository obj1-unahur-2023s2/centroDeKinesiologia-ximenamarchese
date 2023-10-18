import pacientes.*

class Aparato {
	var property color = "blanco"
}

class Magneto inherits Aparato {
	method puedeSerUsado(paciente) = true
	method serUsado(paciente) {
		paciente.nivelDeDolor(paciente.nivelDeDolor() * 0.1) 
	}
}

class Bicicleta inherits Aparato {
	method puedeSerUsado(paciente) = paciente.edad() > 8
	method serUsado(paciente) {
		paciente.nivelDeDolor(4) 
		paciente.fortalezaMuscular(3)
	}
}

class Minitramp inherits Aparato {
	method puedeSerUsado(paciente) = paciente.nivelDeDolor() < 20
	method serUsado(paciente) {
		paciente.fortalezaMuscular(paciente.fortalezaMuscular() * 0.1)
	}
}