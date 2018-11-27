class Cliente {

	var property deuda = 0
	const property condicionesComerciales = []
	// PROMOCION
	var property puntosPromocion = 0

	method agregarCondicionComercial(condicion) {
		condicionesComerciales.add(condicion)	
	}
	
	method comprar(monto) {
		condicionesComerciales.forEach {
			condicion => condicion.comprar(monto, self)
		}
		
		// Comprar propiamente dicho
		deuda = deuda + monto
	}

	method sumarPromocion(puntos) {
		puntosPromocion += puntos
	}
}

object safeShop {
	var property montoMaximoSafeShop = 50

	method comprar(monto, cliente) {
		if (monto > montoMaximoSafeShop) {
			error.throwWithMessage("Debe comprar por menos de " + montoMaximoSafeShop)
		}
	}	
}

object promocion {
	
	method comprar(monto, cliente) {
		if (monto > 20) {
			cliente.sumarPromocion(15)
		}
	}
}

