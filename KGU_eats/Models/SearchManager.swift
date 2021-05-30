//
//  SearchManager.swift
//  KGU_eats
//
//  Created by RooZin on 2021/04/30.
//

protocol SearchManagerDelegate {
    func didUpdateMarketList(_ data : [SearchModel])
    func didFailWithError(_ error : Error)
}

import UIKit

struct SearchManager {
    
    var delegate : SearchManagerDelegate?
    var baseURL = "https://openapi.naver.com/v1/search/local"
    
    func fetchURL(_ place : String) {
        
        let url = "\(baseURL)?query=\(place)&display=5"
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
                delegate?.didFailWithError(error!)
            }
            if let safeData = data {
                DispatchQueue.main.async {
                    if let searchData = self.parseJSON(data: safeData) {
                        delegate?.didUpdateMarketList(searchData)
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
            
            if total != 0 {
                for i in 0...total-1 {
                    let parsingData = SearchModel(marketName: decodedData.items[i].title, marketCategory: decodedData.items[i].category, marketAddress: decodedData.items[i].roadAddress)
                    
                    dataList.append(parsingData)
                }
            }
            else {
                let emptyData = SearchModel(marketName : "검색결과가 없습니다", marketCategory: "", marketAddress: "" )
                dataList.append(emptyData)
            }
                       
            return dataList
        }
        catch{
            delegate?.didFailWithError(error)
            return nil
        }
    }
}
