//LISTA DE LISTAS//

object registroAbatidosCOD {
	
	const registro = [] // [cantidad,dia]
	
	method cant(regi) = regi.first() // también regi.get(0)
	method dia(regi) = regi.last() // también regi.get(1)
	method yaEstaElDia(dia) = registro.any({r => self.dia(r) == dia})
	method registroDia(dia) = registro.find({r=> self.dia(r) == dia})
	
	
	method agregarAbatidosDia(cantidad,dia) {
		if(self.yaEstaElDia(dia)) self.error("Ya existe el día en el registro")
		registro.add([cantidad,dia])
	}
	
	method agregarAbatidosVariosDias(registrosAbatidos) {
		if(registrosAbatidos.any({r=> self.yaEstaElDia(self.dia(r))})) {
			self.error("Ya existe alguno de los días que se quiere agregar, se cancela toda la operación")
		}
		registro.addAll(registrosAbatidos)
	}

	method eliminarElRegistroDelDia(dia) {
		if(not self.yaEstaElDia(dia)) {self.error("No existe el día en el registro")}
		registro.remove(self.registroDia(dia))
	}
	
	method eliminarLosRegistrosDeDias(listaDias) {
		if(listaDias.any({d=> not self.yaEstaElDia(d)})) {
			self.error("Alguno de los días que se quiere borrar no existe en el registro, se cancela toda la operación")
		}
		listaDias.forEach({dia=>self.eliminarElRegistroDelDia(dia)})
	}
	
	
	
	
	method cantidadDeDiasRegistrados() = registro.size()
	method estaVacioElRegistro() = registro.isEmpty()
	method algunDiaAbatio(cantidad) = registro.any({reg=>self.cant(reg)==cantidad})
	method primerValorDeAbatidos() = registro.first()
	method ultimoValorDeAbatidos() = registro.last()
	method maximoValorDeAbatidos() = registro.max({reg => self.cant(reg)})
	method totalAbatidos() = registro.sum({reg=>self.cant(reg)})
	method cantidadDeAbatidosElDia(dia) =
		if(not self.yaEstaElDia(dia))
		self.error("No existe el dia en el registro")
		else 
		self.cant(self.registroDia(dia))
	method ultimoValorDeAbatidosConSize() =  self.cant(registro.get(registro.size()-1))
	method diasConAbatidosSuperioresA(cuanto) = registro.filter({reg => self.cant(reg) > cuanto}).map({reg=>self.dia(reg)})
	method valoresDeAbatidosPares() =  registro.filter({reg => self.cant(reg).even()}).map({reg=>self.cant(reg)})
	method elValorDeAbatidos(cantidad) = registro.find({reg => self.cant(reg) == cantidad})
	method abatidosSumando(cantidad) = registro.map({reg => self.cant(reg) + cantidad})
	method abatidosEsAcotada(n1,n2) = registro.all({reg => self.cant(reg).between(n1,n2)})
	method algunDiaAbatioMasDe(cantidad) = registro.any({reg => self.cant(reg) > cantidad})
	method todosLosDiasAbatioMasDe(cantidad) = registro.all({reg => self.cant(reg) > cantidad})
	method cantidadAbatidosMayorALaPrimera() = registro.count({reg => self.cant(reg) > self.cant(registro.first())})
	method esCrack() {
		if(self.estaVacioElRegistro()) self.error("No hay ningún registro de abatidos")
		if (registro.size()<2) return false
		else return (1..registro.size()-1).all({i => self.cant(registro.get(i)) > self.cant(registro.get(i-1))})
	} 
	
	
	
	//ejercicios de desafio//
	
	
	method agregarAbatidosDiaPlus(cantidad,dia) {
		if(self.yaEstaElDia(dia)) {
			const regi = self.registroDia(dia)
			self.eliminarElRegistroDelDia(dia)
			self.agregarAbatidosDia(self.cant(regi)+cantidad,self.dia(regi))
		}
		else {
			self.agregarAbatidosDia(cantidad,dia)
		}
	}
	
	
	method ordenarRegistro() {
		if(registro.size()>=2) {
			registro.sortBy({a,b=> self.dia(a) < self.dia(b)})
		}
	}

	method esCrackPlus() {
		self.ordenarRegistro()
		if(self.estaVacioElRegistro()) self.error("No hay ningún registro de abatidos")
		if (registro.size()<2) return false
		else return (1..registro.size()-1).all({i => self.cant(registro.get(i)) > self.cant(registro.get(i-1))})
	}
	
	

	

}
	    
	    