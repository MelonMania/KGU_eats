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
    
    @IBAction func koreanFood(_ sender: UIButton) {
        searchManager.fetchURL("연무동한식")
    }
    
    @IBAction func westernFood(_ sender: Any) {
        searchManager.fetchURL("연무동양식")
    }
    
    @IBAction func chineseFood(_ sender: Any) {
        searchManager.fetchURL("연무동중식")
    }
    

    @IBAction func schoolFood(_ sender: Any) {
        searchManager.fetchURL("연무동분식")
    }
    
    @IBAction func nightFood(_ sender: Any) {
        searchManager.fetchURL("연무동야식")
    }
    
    @IBAction func lunchBox(_ sender: Any) {
        searchManager.fetchURL("연무동도시락")
    }
}
//MARK: - SearchManagerDelegate

extension FrontdoorVC : SearchManagerDelegate {
    func didUpdateMarketList(_ data: [SearchModel]) {
        print(data)
    }
    
    func didFailWithError(_ error: Error) {
        print("error")
    }
}

