class Acompaniante{
	method patrimonio() = 0
	
	method esPeligroso()
}

class Dragon inherits Acompaniante{
	override method esPeligroso() = true
}

class Lobo inherits Acompaniante{
	var property tipo
	
	constructor(unTipo){
		tipo = unTipo
	}
	
	override method esPeligroso(){
		return tipo.equals(huargo)
	}
}

object huargo{}