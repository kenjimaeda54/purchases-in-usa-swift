//
//  SettingsViewController.swift
//  purchases in usa
//
//  Created by kenjimaeda on 28/07/22.
//

import UIKit

class SettingsViewController: UIViewController {
	
	@IBOutlet weak var tfIOF: UITextField!
	@IBOutlet weak var tfTaxState: UITextField!
	@IBOutlet weak var tfQuotationDolar: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tfIOF.delegate = self
		tfTaxState.delegate = self
		tfQuotationDolar.delegate = self
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(true)
		updateTaxas()
	}
	
	func updateTaxas() {
		if let iof = tfIOF.text, let taxState = tfTaxState.text,let dolar = tfQuotationDolar.text {
			tc.iof = tc.convertDouble(iof)
			tc.taxState = tc.convertDouble(taxState)
			tc.dolar = tc.convertDouble(dolar)
		}
	}
	
}

//MARK: - UITextFieldDelegate
extension SettingsViewController:UITextFieldDelegate {
	
	public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
	
	public func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
		updateTaxas()
	}
}
