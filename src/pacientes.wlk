import aparatos.*

class Paciente {
	const edad
	var fortalezaMuscular
	var nivelDeDolor
	const aparatos = []
	
	method fortalezaMuscular() = fortalezaMuscular
	method nivelDeDolor() = nivelDeDolor
	method nivelDeDolor(unaCantidad) {
		nivelDeDolor = 0.max(nivelDeDolor - unaCantidad)
	}
	method fortalezaMuscular(unaCantidad) {
		fortalezaMuscular = fortalezaMuscular + unaCantidad
	}
	method edad() = edad  
	
	method puedeUsarAparato(aparato) = aparato.puedeSerUsado(self)
	method usarAparato(aparato) {
		if (self.puedeUsarAparato(aparato)){
			aparato.serUsado(self)
		}
	}
	method agregarAparato(unAparato) = aparatos.add(unAparato)
	method puedeHacerRutina() = aparatos.all({a => self.puedeUsarAparato(a)})
	method realizarSesionCompleta() {
		if (self.puedeHacerRutina()){
			aparatos.forEach({a => self.usarAparato(a)})
		}
	}
}

class Resistente inherits Paciente {
	override method realizarSesionCompleta() {
		super()
		self.fortalezaMuscular(aparatos.size())
	} 
}

class Caprichoso inherits Paciente{
	override method puedeHacerRutina() = super() and aparatos.any({a => a.color() == "Rojo"})
	override method realizarSesionCompleta() {
		super()
		super()
	} 
}

class RapidaRecuperacion inherits Paciente{
	var property cantidadADecrementar = 3
	override method realizarSesionCompleta() {
		super()
		self.nivelDeDolor(cantidadADecrementar)
	}
}
	
	

