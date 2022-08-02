//
//  UIViewControlerAndTaxas.swift
//  purchases in usa
//
//  Created by kenjimaeda on 29/07/22.
//

import UIKit

extension UIViewController {
	//aqui estou extendendo para viewController o acesso ao construtor
	//assim apenaas com tc ja tenho acesso a struct
	var tc: Taxas {
		return Taxas.initConstructor
	}
}
