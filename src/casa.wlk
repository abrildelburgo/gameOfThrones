import persona.*

class Casa{
	var property patrimonio
	var property ciudad
	var property miembros
	
	constructor(unPatrimonio,unaCiudad,unosMiembros){
		patrimonio = unPatrimonio
		ciudad = unaCiudad
		miembros = unosMiembros
	}
	
	method permitirCasamiento(persona,otro){
		return self.esMiembro(persona) && !self.parejaProhibida(persona,otro)
	}
	
	method esMiembro(persona) = miembros.contains(persona)
	
	method parejaProhibida(persona,otro)
	
	method esRica() = patrimonio > 1000
	
	method cantidadMiembros() = miembros.size()
	
	method disminuirFortuna(porcentaje){
		patrimonio = patrimonio - patrimonio * porcentaje / 100
	}
}

object lannister inherits Casa {
	override method parejaProhibida(persona,otro) = persona.tienePareja()
}

object stark inherits Casa{
	override method parejaProhibida(persona,otro) = persona.mismaCasaQue(otro)
}

object guardiaDeLaNoche inherits Casa{
	override method parejaProhibida(persona,otro) = true
}
