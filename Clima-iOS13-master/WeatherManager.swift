//
//  WeatherManager.swift
//  Clima
//
//  Created by Nicholas Ong on 12/12/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
import UIKit

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather:WeatherModel)
    func didFailWithError(error:Error)
}


struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=152b82ff7c898c4714d8b7c64ae84dbc&units=metric"
    
    var urlSession = URLSession()
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName:String){
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
        print(urlString)
    }
    
    func fetchWeather(latitude:Double, longitude:Double){
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(urlString: urlString)
        print(urlString)
    }
    
    func performRequest(urlString:String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                    delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data{
                    if let weather = parseJSON(safeData){
                        delegate?.didUpdateWeather(self, weather: weather )
                    }
                    
                    
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data)->WeatherModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let weather = WeatherModel(condition: id, cityName: name, temperature: temp)
            return weather
            
        }catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
    
  
}
