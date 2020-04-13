//
//  data.swift
//  COVID19UK(API)
//
//  Created by ChiuWanNuo on 08/04/2020.
//  Copyright © 2020 ChiuWanNuo. All rights reserved.
//

import Foundation

struct Vrius: Codable {
    let status: Bool
    let data:[VriusInfo]
}

struct VriusInfo: Codable {
    let confirmed: Int
    let death: Int
    let cured: Int
    let serious: Int
    let negative: Int
    let suspected: Int
    let tested: Int?
    let test_done:Int?
    
}
