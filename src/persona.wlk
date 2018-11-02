import estado.*

class Persona{
	var property casa
	var property conyuges
	var property estado
	var property acompaniantes
	
	constructor(unaCasa, unosConyuges){
		casa = unaCasa
		conyuges = unosConyuges
	}
	
	method tienePareja() = conyuges.size() >= 1 
	
	method mismaCasaQue(otro) = casa.equals(otro.casa())
	
	method sePuedeCasarCon(otro) = casa.permitirCasamiento(self,otro) && otro.casa().permitirCasamiento(otro,self)
	
	method casarseCon(otro){
		if(!self.sePuedeCasarCon(otro)){
			self.error("No se pueden casar estas dos personas")
		}
		conyuges.add(otro)
	}
	
	method patrimonio() = casa.patrimonio() / casa.cantidadMiembros()
	
	//2
	method estaSolo() = acompaniantes.size() == 0
	
	method aliados() = acompaniantes + conyuges + casa.miembros()
	
	method esPeligroso() = estado.equals(vivo) && self.condicionPeligroso()
	
	method condicionPeligroso(){
		return self.aliadosConPlata() || self.conyugesConPlata() || self.alianzaPeligrosa()
	}
	
	method aliadosConPlata() = self.aliados().sum({aliado => aliado.patrimonio()}) >= 10000
	
	method conyugesConPlata() = conyuges.all({conyuge => conyuge.casa().esRica()})
	
	method alianzaPeligrosa() = self.aliados().any({aliado => aliado.esPeligroso()})
	
	method derrocharFortuna(porcentaje){
		casa.disminuirFortuna(porcentaje)
	}
	
	method estaVivo() = estado.equals(vivo)
}
