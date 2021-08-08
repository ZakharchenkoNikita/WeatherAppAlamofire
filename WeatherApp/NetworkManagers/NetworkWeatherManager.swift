//
//  NetworkWeatherManager.swift
//  WeatherApp
//
//  Created by Nikita on 07.08.21.
//
import Foundation

class NetworkWeatherManager {
    
    static let shared = NetworkWeatherManager()
    
    func fetchCurrentWeather(city: String, completionHandler: @escaping (CurrentWeather) -> Void) {
        let weatherAPI = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=1559fdc665dcb90d99eec360d3c64f29"
        guard let url = URL(string: weatherAPI) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                if let currentWeather = self.parseJSON(data: data) {
                    completionHandler(currentWeather)
                }
            }
        }.resume()
    }
    
    private func parseJSON(data: Data) -> CurrentWeather? {
        do {
            let decoder = JSONDecoder()
            let currentWether = try decoder.decode(CurrentWeather.self, from: data)
            return currentWether
        } catch let error {
            print(error.localizedDescription)
        }
        
        return nil
    }
    
    private init() {}
}
