object pepita {
	var energia = 100
	
	method comer(comida) {
		energia = energia + comida.energiaQueAporta()
	}
	
	method volar(distancia) {
		self.validarVolar(distancia)
		energia = energia - self.energiaNecesariaParaVolar(distancia)
	}

	method validarVolar(distancia) {
		if( not self.puedeVolar(distancia) ){
			self.error("no se puede volar" + distancia + "porque no alcanza la energía")
		}
	}

	method puedeVolar(distancia) {
	  return energia >= self.energiaNecesariaParaVolar(distancia)
	}

	method energiaNecesariaParaVolar(distancia) {
		return 10 + distancia
	}	

	method energia() {
		return energia
	}
}

object alpiste {
	method energiaQueAporta() {
		return 20
	}
}

object manzana {
	var madurez = 1
	const base = 5
	
	method madurez() {
		return madurez
	}
	
	method madurez(_madurez) {
		madurez = _madurez
	}
	
	method madurar() {
		self.madurez(madurez + 1)
	}
	
	method energiaQueAporta() {
		return base * madurez
	}
	
}

object pepon {
	var energia = 30
	
	method energia() {
		return energia
	}
		
	method comer(comida) {
		energia = energia + comida.energiaQueAporta() / 2
	}
		
	method volar(distancia) {
		self.validarVolar(distancia)
		energia = energia - self.energiaNecesariaParaVolar(distancia)
	}

	method validarVolar(distancia) {
	  if ( not self.puedeVolar(distancia) ){
		self.error("no se puede volar" + distancia + "porque no alcanza la energía")
	  }
	}

	method puedeVolar(distancia) {
	  return energia >= self.energiaNecesariaParaVolar(distancia)
	}

	method energiaNecesariaParaVolar(distancia) {
	  return 20 + 2 * distancia
	}
	
}

object roque {
	var ave = pepita
	var cenas = 0;
	
	method ave(_ave) {
		ave = _ave
		cenas = 0
	}
	
	method alimentar(alimento) {
		ave.comer(alimento)
		cenas = cenas + 1
	}
}
	//PROBLEMAS CON MILENA REVISAR
object milena {
  const aves = #{pepita, pepon} 

	method agregarAve(ave) {
	  aves.add(ave)
	}

	method abandonarAve(ave){
		aves.remover(ave) //Si no estaba el ave simplemente no hace nada.
	}
	
	method movilizar(distancia) {
		self.validarMovilizar(distancia)
	  	aves.foreach({ave => ave.volar(distancia)})
	  //el all retorna un booleano, se usa el foreach porque todos los objetos deben realizar x acción
	}

	method validarMovilizar(distancia) {
	  if( not self.todasPuedenVolar(distancia)){
		self.error("no todas las aves pueden volar" + distancia + "km")
	  }
	}

	method todasPuedenVolar(distancia) {
	  return aves.all({ave => ave.puedeVolar(distancia)})
	}

}

