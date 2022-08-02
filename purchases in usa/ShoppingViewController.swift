//
//  ViewController.swift
//  purchases in usa
//
//  Created by kenjimaeda on 28/07/22.
//

import UIKit

class ShoppingViewController: UIViewController {
	
	@IBOutlet weak var labDolar: UILabel!
	@IBOutlet weak var labValueInDolar: UILabel!
	@IBOutlet weak var tfValueShopping: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tfValueShopping.delegate = self
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		calculate()
	}
	
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		calculate()
		tfValueShopping.resignFirstResponder()
	}
	
	func calculate() {
		if let value = tfValueShopping.text  {
			let valueDouble =   tc.convertDouble(value)
			labValueInDolar.text = tc.convertCurrency(of: valueDouble * tc.dolar, style: "R$")
			labDolar.text = "Valor sem impostos(dolar \(tc.convertCurrency(of: tc.dolar, style: "")))"
		}
	}
	
}

//MARK: - UITextFieldDelegate
extension ShoppingViewController:UITextFieldDelegate {
	
	func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
		if let value = tfValueShopping.text{
			tc.value = tc.convertDouble(value)
		}
	}
	
}
