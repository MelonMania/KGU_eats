//
//  SearchManager.swift
//  KGU_eats
//
//  Created by RooZin on 2021/04/30.
//

import UIKit

struct SearchManager {
    
    var delegate : SearchManagerDelegate?
    var baseURL = "https://openapi.naver.com/v1/search/local"
    
    func fetchURL(_ place : String) {
        
        let url = "\(baseURL)?query=\(place)"
        let encodedURL = url.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        
        requestGet(encodedURL)
    }
    
    func requestGet(_ url : String) {
        let url = URL(string: url)
        
        var request = URLRequest(url: url!)
        
        request.httpMethod = "GET"
        request.addValue("PcXuuV8z8q7K0_VDW2BW", forHTTPHeaderField: "X-Naver-Client-Id")
        request.addValue("3iqWqZ775y", forHTTPHeaderField: "X-Naver-Client-Secret")
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { (data, response, error) in
            if error != nil {
                delegate?.printLoadError(error!)
            }
            if let safeData = data {
                DispatchQueue.main.async {
                    if let searchData = self.parseJSON(data: safeData) {
                        delegate?.loadCelebPicture(searchData)
                    }
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(data : Data) -> [SearchModel]? {
        var dataList : [SearchModel] = []
        
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(SearchData.self, from: data)
            
            let total = decodedData.total
            
            for i in 0...total-1 {
                let parsingData = SearchModel(marketName: decodedData.items[i].title, marketCategory: decodedData.items[i].category, marketAddress: decodedData.items[i].roadAddress)
                
                dataList.append(parsingData)
            }
            
            return dataList
        }
        catch{
            delegate?.printLoadError(error)
            return nil
        }
    }
}
