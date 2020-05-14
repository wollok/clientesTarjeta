class Cliente {
	var property deuda = 0
	// PROMOCION
	var property puntosPromocion = 0

	method comprar(monto) {
		deuda = deuda + monto
	}

	method sumarPromocion(puntos) {
		puntosPromocion += puntos
	}
}

class ClienteConCondicionesComerciales {
	const cliente
	const condicionesComerciales = []
	
	method comprar(monto) {
		condicionesComerciales.forEach { condicion => condicion.comprar(monto, cliente) }
		cliente.comprar(monto)
	}
	method sumarPromocion(puntos) { cliente.sumarPromocion(puntos) }
}
	
object safeShop {
	var property montoMaximoSafeShop = 50

	method comprar(monto, cliente) {
		if (monto > montoMaximoSafeShop) {
			throw new Exception(message = "Debe comprar por menos de " + montoMaximoSafeShop)
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

