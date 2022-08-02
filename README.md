#  Purchases in USA
Aplicativo para calculo de taxas em dolar 

# Feature
- Aprendi o uso de singleton em Swift
- Segredo  deixar privado  construtor, assim ninguém consegue instanciar
- Outro detalhe interessante  usar  extension para UIViewController, assim não preciso Taxas.initConstructor.propriedades
- Precisa ser implementado em classes, porque struct não permite o uso de getter e setter como imutabilidade


```swift


//========
//outro arquivo
import UIKit

extension UIViewController {
	var tc: Taxas {
		return Taxas.initConstructor
	}
}

//=======
import Foundation

//https://stackoverflow.com/questions/36788169/whats-the-difference-between-struct-based-and-class-based-singletons
class Taxas  {
	
	//desing patern singleton
	static let initConstructor = Taxas()
	
	var value: Double = 0.0
	var taxState: Double = 7.5
	var iof: Double = 6.5
	var dolar: Double = 5.25
	var formatter = NumberFormatter()

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

```





