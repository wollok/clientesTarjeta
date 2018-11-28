class Cliente {

	var property deuda = 0
	// PROMOCION
	var property puntosPromocion = 0

	method comprar(monto) {
		// Comprar propiamente dicho
		deuda = deuda + monto
	}

	method sumarPromocion(puntos) {
		puntosPromocion += puntos
	}
}

class ClienteDecorador {
	const cliente
	
	constructor(_cliente) {
		cliente = _cliente
	}
	
	method comprar(monto)
	method sumarPromocion(puntos) { cliente.sumarPromocion(puntos) }
}
	
class ClienteSafeShop inherits ClienteDecorador {
	var property montoMaximoSafeShop = 50

	override method comprar(monto) {
		if (monto > montoMaximoSafeShop) {
			error.throwWithMessage("Debe comprar por menos de " + montoMaximoSafeShop)
		}
		cliente.comprar(monto)
	}	
}

class ClientePromocion inherits ClienteDecorador {
	
	override method comprar(monto) {
		cliente.comprar(monto)
		if (monto > 20) {
			cliente.sumarPromocion(15)
		}
	}
}

