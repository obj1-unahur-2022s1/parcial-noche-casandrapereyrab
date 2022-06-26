/*
 En ```comidasQueLeGustanA```. Debia retonar las comidas que le agredan de la oferta de comida ```method comidasQueLeGustanA(unComensal) = comidasPreparadas.filter({c=> unComensal.leAgrada(c) })```
 En ```elegirUnPlatoPara()``` la elección del plato debe ser despues de realizar el control del que la colección esta vacia.
 */
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
	
	method comidasQueLeGustanA(unComensal) = comidasPreparadas.filter({c=> unComensal.leAgrada(c) })
	
	// BONUS
	method elegirUnPlatoPara(unComensal) {
		
		
		if(self.comidasQueLeGustanA(unComensal).isEmpty()) {self.error("Al comensal no le gusta ningun plato.")}
		var plato = self.comidasQueLeGustanA(unComensal).anyOne()
		self.sacarComida(plato) 
		unComensal.comer(plato)
	}
}