//
//  BackdoorData.swift
//  KGU_eats
//
//  Created by RooZin on 2021/04/30.
//

import Foundation

struct SearchData : Codable {
    let total : Int
    let items : [Info]
}

struct Info : Codable {
    let title : String
    let category : String
    let roadAddress : String
}
