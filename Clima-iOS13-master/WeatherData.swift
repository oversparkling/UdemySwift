//
//  WeatherData].swift
//  Clima
//
//  Created by Nicholas Ong on 13/12/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable{
    let name:String
    let main: Main
    let weather:[Weather]
}

struct Main:Decodable {
    let temp: Double
}

struct Weather:Decodable{
    let id:Int
    let description:String
}
