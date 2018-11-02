import casa.*
import estado.*
import persona.*

class Conspiracion{
	var property miembros
	var property victima
	
	constructor(unosMiembros, unaVictima){
		miembros = unosMiembros
		if(!unaVictima.esPeligrosa()){
			self.error("Ataca a alguien peligroso chantaaa")
		}
		victima = unaVictima
	}
	
	method conspirarEnContraDeVictima(){
		miembros.forEach({miembro => miembro.conspirarEnContraDe(victima)})
	}
	
	method cantidadTraidores() = self.traidores().size()
	
	method traidores() = miembros.filter({miembro => victima.aliados().contains(miembro)})
	
	method ejecucionExitosa() = !victima.esPeligroso()
}


class Conspirador{
	var property tipo
	
	constructor(unTipo){
		tipo = unTipo
	}
	
	method conspirarEnContraDe(victima){
		tipo.atacar(victima)
	}
}


object sutil{
	var property casas = #{lannister, stark, guardiaDeLaNoche}
	
	method atacar(victima){
		victima.casarseCon(self.pobre())
	}
	
	method pobre() = self.miembrosDeCasaPobre().find({miembro => miembro.estaVivo() && !miembro.tienePareja()})
	
	method miembrosDeCasaPobre() = casas.min({casa => casa.patrimonio()}).miembros()
}

class Asesino{
	method atacar(victima){
		victima.estado(muerto)
	}
}

object asesinoPrecavido inherits Asesino{
	override method atacar(victima){
		if(victima.estaSolo()){
			super(victima)
		}
	}
}

object disipado{
	var property porcentaje
	
	method atacar(victima){
		victima.derrocharFortuna(porcentaje)
	}
}

object miedoso{
	method atacar(victima) {}
}