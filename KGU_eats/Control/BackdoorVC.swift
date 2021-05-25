//
//  BackdoorVC.swift
//  KGU_eats
//
//  Created by RooZin on 2021/04/28.
//

import UIKit

class BackdoorVC: UIViewController {
   
    var searchManager = SearchManager()
    
    @IBOutlet weak var searchField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchManager.delegate = self
    }
    
    @IBAction func KoreanFood(_ sender: UIButton) {
        searchManager.fetchURL("수원경기대후문한식")
    }
    
    @IBAction func WesternFood(_ sender: Any) {
        searchManager.fetchURL("수원경기대후문양식")
    }
    
    @IBAction func ChineseFood(_ sender: Any) {
        searchManager.fetchURL("수원경기대후문중식")
    }
    

    @IBAction func SchoolFood(_ sender: Any) {
        searchManager.fetchURL("수원경기대후문분식")
    }
    
    @IBAction func NightFood(_ sender: Any) {
        searchManager.fetchURL("수원경기대후문야식")
    }
    
    @IBAction func LunchBox(_ sender: Any) {
        searchManager.fetchURL("수원경기대후문도시락")
    }
    
    @IBAction func PressSearch(_ sender: UIButton) {
        searchManager.fetchURL(searchField)
    }
    
}

extension BackdoorVC {
    
}

extension BackdoorVC : SearchManagerDelegate {
    func didUpdateMarketList(_ data: [SearchModel]) {
        print(data)
    }
    
    func didFailWithError(_ error: Error) {
        print("error")
    }
}

