//
//  CoinData.swift
//  ByteCoin
//
//  Created by Ivo Specht on 14/03/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CoinData: Codable {
    
    let time: String
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Double
}
