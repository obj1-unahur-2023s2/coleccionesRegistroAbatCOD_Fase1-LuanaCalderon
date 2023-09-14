
object registroAbatidosCOD {
	
const dias = []
	const cantidadDeAbatidos = []
	
    method indexOf(element,list) {
        return (0..list.size()-1).find({index => list.get(index) == element})
    }    
	
	method agregarAbatidosDia(cantidad, dia){
		if(dias.contains(dia)){
			self.error("Ya existe registro para el dia indicado")
		}
		dias.add(dia)
		cantidadDeAbatidos.add(cantidad)
	}
	
	method agregarAbatidosVariosDias(listaCantidad, listaDia){
			dias.addAll(listaDia)
			cantidadDeAbatidos.addAll(listaCantidad)
		
	}
	
	method eliminarElRegistroDelDia(dia){
		var index = self.indexOf(dia,dias)
		dias.remove(dia)
		cantidadDeAbatidos.remove(cantidadDeAbatidos.get(index))
	}
	
	method eliminarLosRegistrosDeDias(listaDia){
		listaDia.forEach()
	}
	
	
	method cantidadDeDiasRegistrados() =  dias.size()
	
	
	method estaVacioElRegistro() =  dias.isEmpty()
	
	
	method algunDiaAbatio(cantidad) = cantidad.any({x => x == cantidad})
	
	
	method primerValorDeAbatidos() = cantidadDeAbatidos.get(0)
	
	
	method ultimoValorDeAbatidos() =  cantidadDeAbatidos.last()
	
	
	method maximoValorDeAbatidos() = cantidadDeAbatidos.max()
	
	method totalAbatidos()  {} //consultar
	
	method cantidadDeAbatidosElDia(dia){
		var index = self.indexOf(dia, dias)
		return cantidadDeAbatidos.get(index)
	}
	
	method ultimoValorDeAbatidosConSize() = cantidadDeAbatidos.get(cantidadDeAbatidos.size()-1)
	
	
	method diasConAbatidosSuperrioresA(cuanto) = cantidadDeAbatidos.filter({ x => x > cuanto }).size()
	
	
	method valoresDeAbatidosPares() =cantidadDeAbatidos.filter({ abatidos => abatidos.even()})
	
	
	method elValorDeAbatidos(cantidad) = cantidadDeAbatidos.find(cantidad)
	
	
	method abatidosSumando(cantidad) =cantidadDeAbatidos.map({x => x + cantidad})
	
	
	method abatidosEsAcotada(r1, r2) = cantidadDeAbatidos.all({ numero => numero > r1 and numero < r2})
	
	
	method algunDiaAbatioMasDe(cantidad) = cantidadDeAbatidos.any({x => x < cantidad})
	
	
	method todosLosDiasAbatioMasDe(cantidad) = cantidadDeAbatidos.all({x => x > cantidad})
	
	
	method cantidadAbatidosMayorALaPrimera() =  cantidadDeAbatidos.filter({ x => x > cantidadDeAbatidos.first()})
	
	
	method esCrack(){
		const indexs = (1..cantidadDeAbatidos.size()-1)
		return indexs.all({ i => cantidadDeAbatidos.get(i-1) < cantidadDeAbatidos.get(i)})
	}
	
	
	
}
  

    