//
//  ViewController.swift
//  KGU_eats
//
//  Created by RooZin on 2021/03/26.
//

import UIKit

class FirstVC: UIViewController {

    @IBOutlet weak var eSquare: UIButton!
    @IBOutlet weak var gamsungCore: UIButton!
    @IBOutlet weak var teacher: UIButton!
    @IBOutlet weak var dreamTower: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eSquare.layer.borderWidth = 2
        eSquare.layer.borderColor = UIColor.systemGreen.cgColor
        eSquare.layer.cornerRadius = 10
        gamsungCore.layer.borderWidth = 2
        gamsungCore.layer.borderColor = UIColor.systemGreen.cgColor
        gamsungCore.layer.cornerRadius = 10
        teacher.layer.borderWidth = 2
        teacher.layer.borderColor = UIColor.systemGreen.cgColor
        teacher.layer.cornerRadius = 10
        dreamTower.layer.borderWidth = 2
        dreamTower.layer.borderColor = UIColor.systemGreen.cgColor
        dreamTower.layer.cornerRadius = 10
    }
    
    @IBAction func goToEsquare(_ sender: UIButton) {
        self.performSegue(withIdentifier: "eSquare", sender: self)
    }
    
    @IBAction func goToGamsungCore(_ sender: UIButton) {
        self.performSegue(withIdentifier: "gamsungCore", sender: self)
    }
    
    @IBAction func goToTeacher(_ sender: UIButton) {
        self.performSegue(withIdentifier: "teacher", sender: self)
    }
    
    @IBAction func goToDreamTower(_ sender: UIButton) {
        self.performSegue(withIdentifier: "dreamTower", sender: self)
    }
    
    @IBAction func goToBackDoor(_ sender: UIButton) {
        self.performSegue(withIdentifier: "Backdoor", sender: self)
    }
    
    @IBAction func goToFrontDoor(_ sender: UIButton) {
        self.performSegue(withIdentifier : "Frontdoor", sender : self)
    }
    
}



