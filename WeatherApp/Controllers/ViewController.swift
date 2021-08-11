//
//  ViewController.swift
//  WeatherApp
//
//  Created by Nikita on 06.08.21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: IB Outlets
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherStatusLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var maximumTempLabel: UILabel!
    @IBOutlet weak var minimumTempLabel: UILabel!
    
    @IBOutlet weak var weatherConditionImage: UIImageView!
    
    // MARK: properties
    let networkManager = NetworkWeatherManager.shared
    
    // MARK: override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeather()
    }
    
    // MARK: IB Actions
    @IBAction func searchButtonPressed() {
        let alert = UIAlertController(title: "Поиск", message: nil, preferredStyle: .alert)
        
        alert.addTextField { searchTF in
            searchTF.placeholder = "Введите город..."
            searchTF.returnKeyType = .search
            searchTF.clearButtonMode = .whileEditing
            searchTF.autocapitalizationType = .words
        }
        
        let searchAction = UIAlertAction(title: "Искать", style: .default) { _ in
            guard let searchTF = alert.textFields?.first else { return }
            guard let city = searchTF.text, !city.isEmpty else { return }
            
            let cityName = city.split(separator: " ").joined(separator: "%20")
            
            self.networkManager.fetchWeather(city: cityName) { currentWeather in
                self.updateInterface(weather: currentWeather)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Отменить", style: .cancel, handler: nil)
        
        alert.addAction(searchAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
}

// MARK: private methods
extension ViewController {
    
    private func getWeather() {
        networkManager.fetchWeather(city: "Berlin") { currentWeather in
            self.updateInterface(weather: currentWeather)
        }
    }
    
    private func updateInterface(weather: CurrentWeather) {
        DispatchQueue.main.async {
            self.cityNameLabel.text = weather.name ?? ""
            self.currentTempLabel.text = self.getTempInСelsius(value: weather.main?.temp ?? 0)
            self.maximumTempLabel.text = self.getTempInСelsius(value: weather.main?.tempMax ?? 0)
            self.minimumTempLabel.text = self.getTempInСelsius(value: weather.main?.tempMin ?? 0)
            
            weather.weather?.forEach { weather in
                self.weatherStatusLabel.text = weather.description ?? ""
                self.weatherConditionImage.image = UIImage(systemName: weather.weatherConditions)
            }
        }
    }
    
    private func getTempInСelsius(value: Double) -> String {
        String(format: "%.0f", value - 273.15)
    }
}
