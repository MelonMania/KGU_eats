//
//  ViewController.swift
//  KGU_eats
//
//  Created by RooZin on 2021/03/26.
//

import UIKit

class FirstVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToEsquare(_ sender: UIButton) {
    }
    
    @IBAction func goToGamsungCore(_ sender: UIButton) {
    }
    
    @IBAction func goToTeacher(_ sender: UIButton) {
    }
    
    @IBAction func goToDreamTower(_ sender: UIButton) {
    }
    
    @IBAction func goToBackDoor(_ sender: UIButton) {
        self.performSegue(withIdentifier: "Backdoor", sender: self)
        
    }
    
    @IBAction func goToFrontDoor(_ sender: UIButton) {
        self.performSegue(withIdentifier : "Frontdoor", sender : self)
    }
    
}



