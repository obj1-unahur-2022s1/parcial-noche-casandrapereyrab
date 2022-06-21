import comidas.*
import comensales.*

object cocina {
	const property comidasPreparadas = []
	
	method prepararComida(unaComida) { comidasPreparadas.add(unaComida) }
	
	method sacarComida(unaComida) { comidasPreparadas.remove(unaComida) }
	
	method buenaOfertaVegetariana() = (self.cantComidasCarnivoras() - self.cantComidasVegetarianas()).abs() <= 2
	
	method cantComidasVegetarianas() = comidasPreparadas.count({ c => c.aptoVegetariano() })
	
	method cantComidasCarnivoras() = comidasPreparadas.count({ c => not c.aptoVegetariano() })
	
	method platoFuerteCarnivoro() = self.comidasCarnivoras().max({ c => c.valoracion() })
	
	method comidasVegetarianas() = comidasPreparadas.filter({ c => c.aptoVegetariano() })
	
	method comidasCarnivoras() = comidasPreparadas.filter({ c => not c.aptoVegetariano() })
	
	method comidasQueLeGustanA(unComensal) = unComensal.comidasQueLeGusta()
	
	// BONUS
	method elegirUnPlatoPara(unComensal) {
		var plato = self.comidasQueLeGustanA(unComensal).anyOne()
		
		if(self.comidasQueLeGustanA(unComensal).isEmpty()) {self.error("Al comensal no le gusta ningun plato.")}
		self.sacarComida(plato) 
		unComensal.comer(plato)
	}
}