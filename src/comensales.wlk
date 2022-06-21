import comidas.*

class Comensales {
	var property peso
	const property comidasIngeridas = []
	const property comidasQueLeGusta = []
	
	method comer(unaComida) { comidasIngeridas.add(unaComida) }
	
	method leAgrada(unaComida)
	
	method estaSatisfecho() = comidasIngeridas.sum({ c => c.peso() }) >= peso * 1 / 100 and self.condicionAdicional()
	
	method condicionAdicional()
	
	method agregarUnaComidaQueLeGusta(unaComida) { if (self.leAgrada(unaComida)) {comidasQueLeGusta.add(unaComida)} }
}

class Vegetariano inherits Comensales {
	override method leAgrada(unaComida) = unaComida.aptoVegetariano() and unaComida.valoracion() > 85
	
	override method condicionAdicional() = comidasIngeridas.all({ c => not c.esAbundante() })
}

class HambrePopular inherits Comensales {
	override method leAgrada(unaComida) = unaComida.esAbundante()
	
	override method condicionAdicional() = true
}

class PaladarFino inherits Comensales {
	override method leAgrada(unaComida) = unaComida.peso().between(150,300) and unaComida.valoracion() > 100
	
	override method condicionAdicional() = comidasIngeridas.size().even()
}