class Plato {
	
	var property peso = 0
	var property aptoVegetariano = false
	var property valoracion = 0
	var property esAbundante = peso > 250
	
}

class Provoleta inherits Plato {
	var property tieneEspecias = true
	
	override method aptoVegetariano() = not tieneEspecias
	
	override method valoracion() = if (self.esEspecial()) {120} else {80}
	
	method esEspecial() = self.esAbundante() or self.tieneEspecias()
}

class HamburguesaCarne inherits Plato {
	const property tipoDePan
	
	override method peso() = 250
	
	override method aptoVegetariano() = false
	
	override method valoracion() = 60 + tipoDePan.valoracionPan()
}

class HamburguesaVegetariana inherits HamburguesaCarne {
	const property legumbre 
	
	override method aptoVegetariano() = true
	
	override method valoracion() = super() + self.plus()
	
	method plus() = 17.min(2 * legumbre.size())
}

class Parrillada inherits Plato {
	const property cortes = []
	
	method agregarCorte(unCorteDeCarne) { cortes.add(unCorteDeCarne) }
	
	override method peso() = cortes.sum({ c => c.peso() })
	
	override method aptoVegetariano() = false
	
	override method valoracion() = ((15 * self.corteMaximaCalidad()) - cortes.size()).abs() 
	
	method corteMaximaCalidad() = cortes.max({ c => c.calidad() }).calidad()
}

class CorteDeCarne {
	var property calidad 
	var property peso
}


class Pan {
	method valoracionPan()
}

class Industrial inherits Pan {
	override method valoracionPan() = 0
}

class Casero inherits Pan {
	override method valoracionPan() = 20
}

class DeMasaMadre inherits Pan {
	override method valoracionPan() = 45
}
