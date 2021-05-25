//
//  Frontdoor.swift
//  KGU_eats
//
//  Created by RooZin on 2021/05/25.
//

import UIKit

class FrontdoorVC: UIViewController {
    
    var searchManager = SearchManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchManager.delegate = self
    }
    
    @IBAction func KoreanFood(_ sender: UIButton) {
        searchManager.fetchURL("연무동한식")
    }
    
    @IBAction func WesternFood(_ sender: Any) {
        searchManager.fetchURL("연무동양식")
    }
    
    @IBAction func ChineseFood(_ sender: Any) {
        searchManager.fetchURL("연무동중식")
    }
    

    @IBAction func SchoolFood(_ sender: Any) {
        searchManager.fetchURL("연무동분식")
    }
    
    @IBAction func NightFood(_ sender: Any) {
        searchManager.fetchURL("연무동야식")
    }
    
    @IBAction func LunchBox(_ sender: Any) {
        searchManager.fetchURL("연무동도시락")
    }
}

extension FrontdoorVC : SearchManagerDelegate {
    func didUpdateMarketList(_ data: [SearchModel]) {
        print(data)
    }
    
    func didFailWithError(_ error: Error) {
        print("error")
    }
}

