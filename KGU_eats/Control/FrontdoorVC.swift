//
//  Frontdoor.swift
//  KGU_eats
//
//  Created by RooZin on 2021/05/25.
//

import UIKit

class FrontdoorVC: UIViewController {
 
    var searchManager = SearchManager()
    
    var keepData : [SearchModel] = []
    let cellIdentifier : String = "cell"
    var category : String = ""
    
    @IBOutlet weak var searchField: UITextField! { didSet { searchField.delegate = self }}
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchField.delegate = self
        searchManager.delegate = self
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    @IBAction func koreanFood(_ sender: UIButton) {
        searchManager.fetchURL("연무동한식")
        category = "🍚한식"
    }
    
    @IBAction func westernFood(_ sender: Any) {
        searchManager.fetchURL("연무동양식")
        category = "🍝양식"
    }
    
    @IBAction func chineseFood(_ sender: Any) {
        searchManager.fetchURL("연무동중식")
        category = "🥟중식"
    }
    

    @IBAction func schoolFood(_ sender: Any) {
        searchManager.fetchURL("연무동분식")
        category = "🌭분식"
    }
    
    @IBAction func nightFood(_ sender: Any) {
        searchManager.fetchURL("연무동일식")
        category = "🍣일식"
    }
    
    @IBAction func lunchBox(_ sender: Any) {
        searchManager.fetchURL("연무동도시락")
        category = "🍱도시락"
    }
    
    @IBAction func pressSearch(_ sender: UIButton) {
        if let safeData = searchField.text {
            searchManager.fetchURL("연무동"+"\(safeData)")
            category = safeData
        }
        self.view.endEditing(true)
    }
    
}

//MARK: - SearchManagerDelegate

extension FrontdoorVC : SearchManagerDelegate {
    func didUpdateMarketList(_ data: [SearchModel]) {
        keepData = data
        tableView.reloadData()
    }
    
    func didFailWithError(_ error: Error) {
        print("error")
    }
}

//MARK: - UITextFieldDelegate

extension FrontdoorVC : UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        pressSearch(searchButton)
        return true
    }
}

//MARK: - UITableViewDataSource, UITableViewDelegate

extension FrontdoorVC : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.keepData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let text : String = "\(self.keepData[indexPath.row].marketName) \n\(self.keepData[indexPath.row].marketAddress)"
        cell.textLabel?.text = text.replacingOccurrences(of: "<b>", with: "").replacingOccurrences(of: "</b>", with: "").replacingOccurrences(of: "&amp;", with: "")
        cell.textLabel?.numberOfLines = 0
        
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return self.category
        default:
            return ""
        }
    }
}

