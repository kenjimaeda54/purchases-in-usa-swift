//
//  TotalViewController.swift
//  purchases in usa
//
//  Created by kenjimaeda on 28/07/22.
//

import UIKit

class TotalViewController: UIViewController {
	
	@IBOutlet weak var labTotalTaxState: UILabel!
	@IBOutlet weak var labTotalDolar: UILabel!
	@IBOutlet weak var labTotalValue: UILabel!
	@IBOutlet weak var swCreditCard: UISwitch!
	@IBOutlet weak var labIOF: UILabel!
	@IBOutlet weak var labTaxStateValue: UILabel!
	@IBOutlet weak var labTotalIOF: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		updateValues()
	}
	
	@IBAction func handleCreditCard(_ sender: UISwitch) {
		updateValues()
	}
	
	func updateValues(){
		labIOF.text = "IOF (\(tc.iof)%)"
		labTaxStateValue.text = "Tax state (\(tc.taxState)%)"
		labTotalDolar.text = tc.convertCurrency(of: tc.valueInDolar, style: "U$")
		labTotalTaxState.text = tc.convertCurrency(of: tc.valueWithTaxState, style: "U$")
		labTotalIOF.text = tc.convertCurrency(of: tc.valueWithIOF, style: "U$")
		let valueTotal = swCreditCard.isOn ? tc.calculate(true) : tc.calculate(false)
		labTotalValue.text = tc.convertCurrency(of: valueTotal, style: "U$")
	}
	
	
}
