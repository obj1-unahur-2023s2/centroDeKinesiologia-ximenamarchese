
object centroDeKinesiologia {
	const aparatos = []
	const pacientes = []
	
	method agregarAparato(unAparato) {aparatos.add(unAparato)}
	method agregarPaciente(unPaciente) {pacientes.add(unPaciente)}
	method colorDeAparatos() = aparatos.map({a => a.color()}).asSet()
	method pacientesMenoresDe8() = pacientes.filter({p => p.edad() < 8})
	method cantidadDePacientesQueNoPuedenCumplirSuSesion() = pacientes.count({p => not p.puedeHacerRutina()})
	method estaEnOptimasCondiciones() = aparatos.all({a => not a.necesitaMantenimiento()})
	method cantidadDeAparatos() = aparatos.size()
	method estaComplicado() = aparatos.size(self.aparatosQueNecesitanMantenimiento()) >= self.cantidadDeAparatos()/2
	method aparatosQueNecesitanMantenimiento() = aparatos.filter({a => a.necesitaMantenimiento()})
	method registrarVisitaDeTecnico() {
		self.aparatosQueNecesitanMantenimiento().forEach({a => a.hacerMantenimiento()})
	}
}
