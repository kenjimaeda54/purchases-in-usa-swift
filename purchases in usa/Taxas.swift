//
//  Taxas.swift
//  purchases in usa
//
//  Created by kenjimaeda on 29/07/22.
//

import Foundation

//singleton precisam ser class
//porque classes sao mutaveis e struct nao

//https://stackoverflow.com/questions/36788169/whats-the-difference-between-struct-based-and-class-based-singletons

//ou seja nao consigo alterar minhas varaiveis mesmo com getter e setter
class Taxas  {
	
	//desing patern singleton
	static let initConstructor = Taxas()
	
	var value: Double = 0.0
	var taxState: Double = 7.5
	var iof: Double = 6.5
	var dolar: Double = 5.25
	var formatter = NumberFormatter()
	
	//garantir que meu construtor nao e chamado
	private init() {
		//permite grupos separadores
		formatter.usesGroupingSeparator = true
	}
	
	func convertDouble(_ value: String) -> Double {
		//a ideia aqui e so transformar com seguranca em double
		//teclado pode vim com , caso seja em portugues
		formatter.numberStyle = .none
		let value = formatter.number(from: value)?.doubleValue ?? 0.0
		return value
	}
	
	func convertCurrency(of value: Double, style currency: String) -> String {
		formatter.alwaysShowsDecimalSeparator = true
		formatter.numberStyle = .currency
		formatter.currencySymbol = currency
		let formated = formatter.string(from: value as NSNumber)!
		return formated
	}
	
	
	
	var valueInDolar: Double {
		return value * dolar
	}
	
	var valueWithTaxState:Double {
		return valueInDolar * taxState/100
	}
	
	var valueWithIOF: Double {
		return  valueInDolar  * iof / 100
	}
	
	func calculate (_ isCreditCard: Bool) -> Double {
		var total = valueInDolar + valueWithTaxState
		if isCreditCard  {
			total += valueWithIOF
		}
		return total
	}
	
}
