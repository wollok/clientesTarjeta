class Cliente {

	var property deuda = 0
	
	// SAFE SHOP
	var property tieneSafeShop = false
	var property montoMaximoSafeShop = 50
	
	// PROMOCION
	var property tienePromocion = false
	var property puntosPromocion = 0

	method comprar(monto) {
		// SAFE SHOP	
		if (monto > montoMaximoSafeShop) {
			error.throwWithMessage("Debe comprar por menos de " + montoMaximoSafeShop)
		}
		
		// Comprar propiamente dicho
		deuda = deuda + monto
		
		// PROMOCION
		if (monto > 20) {
			puntosPromocion = puntosPromocion + 15
		}
	}

}

