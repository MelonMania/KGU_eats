//
//  TeacherVC.swift
//  KGU_eats
//
//  Created by RooZin on 2021/05/31.
//

import UIKit

class TeacherVC : UIViewController {

    var stepperValue : Int = 0
    
    @IBOutlet weak var menu1Stepper: UIStepper!
    @IBOutlet weak var menu2Stepper: UIStepper!
    @IBOutlet weak var menu3Stepper: UIStepper!
    @IBOutlet weak var menu4Stepper: UIStepper!
    
    @IBOutlet weak var menu1Amount: UILabel!
    @IBOutlet weak var menu2Amount: UILabel!
    @IBOutlet weak var menu3Amount: UILabel!
    @IBOutlet weak var menu4Amount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menu1Stepper.wraps = true
        menu1Stepper.autorepeat = true
        menu1Stepper.maximumValue = 5
        menu2Stepper.wraps = true
        menu2Stepper.autorepeat = true
        menu2Stepper.maximumValue = 5
        menu3Stepper.wraps = true
        menu3Stepper.autorepeat = true
        menu3Stepper.maximumValue = 5
        menu4Stepper.wraps = true
        menu4Stepper.autorepeat = true
        menu4Stepper.maximumValue = 5
    }
    
    @IBAction func menu1AmountChange(_ sender: UIStepper) {
        menu1Amount.text = Int(sender.value).description
    }
    
    @IBAction func menu2AmountChange(_ sender: UIStepper) {
        menu2Amount.text = Int(sender.value).description
    }
    @IBAction func menu3AmountChange(_ sender: UIStepper) {
        menu3Amount.text = Int(sender.value).description
    }
    @IBAction func menu4AmountChange(_ sender: UIStepper) {
        menu4Amount.text = Int(sender.value).description
    }
    
}
