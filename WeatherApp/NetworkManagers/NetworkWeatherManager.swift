//
//  NetworkWeatherManager.swift
//  WeatherApp
//
//  Created by Nikita on 07.08.21.
//
import Foundation
import Alamofire

class NetworkWeatherManager {
    
    static let shared = NetworkWeatherManager()
    
    private init() {}
    
    func fetchWeather(city: String, completionHandler: @escaping (CurrentWeather) -> Void) {
        let weatherAPI = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=1559fdc665dcb90d99eec360d3c64f29"
        AF.request(weatherAPI)
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    guard let currentWeather = value as? [String: Any] else { return }
                    let weather = CurrentWeather(currentWeather: currentWeather)
                    completionHandler(weather)
                case .failure(let error):
                    print(error)
                }
            }
    }
}
