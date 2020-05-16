class Cliente {
	var property deuda = 0
	var property puntosPromocion = 0

	method comprar(monto) {
		deuda = deuda + monto
	}

	method sumarPromocion(puntos) {
		puntosPromocion += puntos
	}
}

class ClienteDecorador {
	const cliente
	
	method comprar(monto)
	method sumarPromocion(puntos) { cliente.sumarPromocion(puntos) }
}
	
class ClientePromocion inherits ClienteDecorador {
	override method comprar(monto) {
		cliente.comprar(monto)
		if (monto > 20) {
			cliente.sumarPromocion(15)
		}
	}
}

class ClienteSafeShop inherits ClienteDecorador {
	var property montoMaximoSafeShop = 50

	override method comprar(monto) {
		if (monto > montoMaximoSafeShop) {
			throw new Exception(message = "Debe comprar por menos de " + montoMaximoSafeShop)
		}
		cliente.comprar(monto)
	}	
}
