//
//  BitcoinPriceModel.swift
//  ByteCoin
//
//  Created by Nicholas Ong on 13/12/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct BitcoinPriceModel: Codable{
    let time: String
    let asset_id_base: String
    let asset_id_quote: String
    let rate:Double
    
}
