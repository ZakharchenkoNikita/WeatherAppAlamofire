//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Nikita on 06.08.21.
//

struct CurrentWeather: Decodable {
    let name: String?
    let weather: [Weather]?
    let main: Main?
    
    init(currentWeather: [String: Any]) {
        let weatherDict = currentWeather["weather"] as? [[String: Any]] ?? [[:]]
        let mainDict = currentWeather["main"] as? [String: Any] ?? [:]
        
        name = currentWeather["name"] as? String
        weather = [Weather(values: weatherDict)]
        main = Main(value: mainDict)
    }
}
