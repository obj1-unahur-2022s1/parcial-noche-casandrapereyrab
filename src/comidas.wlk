/* 
1) La mejor opción para manejar el peso en las comidas era la siguiente:
- método abstracto peso en Plato
- const property peso en Provoleta
- en esAbundante() usar ```self.peso()```
2) La mejor opción para la valoración y aptoVegetariano  también era definir un método abstracto en Plato para que luego cada sub-clase implemente y retorne el valor que corresponde.
3) En ```valoracion()``` de Parrillada tenias que usar el max() en lugar de abs()
4) Para esté modelo lo más adecuado era que los panes sean objetos con nombre propio en lugar de clases. "Los tres únicos panes..." la clave en el enunciado esta en la palabra únicos.
*/
class Plato {
	
	method peso()
	method aptoVegetariano()
	method valoracion()
	method esAbundante() = self.peso() > 250
	
}

class Provoleta inherits Plato {
	var property tieneEspecias = true
	const property peso
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
	
	override method valoracion() = 0.max((15 * self.corteMaximaCalidad()) - cortes.size())
	
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
