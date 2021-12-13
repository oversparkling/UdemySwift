//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate{
    func updateByteCoinPrice(latestPrice:Double)
    func didFailWithError(error:Error)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "API_KEY_HERE"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    var delegate: CoinManagerDelegate?
    func getCoinPrice(for currency:String){
        let url = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(with: url)
    }
    
    func performRequest(with urlString: String){
        print(urlString)
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    delegate?.didFailWithError(error: error!)
                }
                if let safeData = data {
                    let latestPrice = self.parseJSON(safeData)
                    print(latestPrice)
                    delegate?.updateByteCoinPrice(latestPrice: latestPrice!)
                }
                
            }
            task.resume()
        }
        
    }
    
    func parseJSON(_ data:Data) -> Double?{
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(BitcoinPriceModel.self, from: data)
            let price = decodedData.rate
            return price
        }
        catch{
            print("Error")
            return nil
            
        }
        
    }
    
}
