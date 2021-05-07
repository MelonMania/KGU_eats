//
//  ViewController.swift
//  KGU_eats
//
//  Created by RooZin on 2021/03/26.
//

import UIKit

class FirstVC: UIViewController {

    var searchManager = SearchManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchManager.delegate = self
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
        searchManager.fetchURL("수원")
    }
    
    @IBAction func goToFrontDoor(_ sender: UIButton) {
        
    }
    
}

extension FirstVC : SearchManagerDelegate {
    func didUpdateMarketList(_ data: [SearchModel]) {
        print(data)
    }
    
    func didFailWithError(_ error: Error) {
        print("error")
    }
}

