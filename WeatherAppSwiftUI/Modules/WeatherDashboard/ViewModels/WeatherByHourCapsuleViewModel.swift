//
//  WeatherByHourCapsuleViewModel.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 27/09/25.
//
import SwiftUI

final class WeatherByHourCapsuleViewModel: Identifiable {
    let id = UUID()
    private let weatherByHour: Current
    
    init(weatherByHour: Current) {
        self.weatherByHour = weatherByHour
    }
    
    var unixTime: Int {
        weatherByHour.dt
    }
    
    var temperature: Double {
        weatherByHour.temp
    }
    
    var weatherIcon: String {
        let weatherState = WeatherState.classifyWeatherState(id: weatherByHour.weather.first?.id ?? 0, isDay: isDay)
        let icon = WeatherState.getWeatherStateIconName(weatherState: weatherState)
        return icon
    }
    
    var precipitationProbability: String {
        if let chance = weatherByHour.pop {
            return "\(Int(chance * 100))%"
        }
        return "null%"
    }
    
    private var isDay: Bool {
        guard let isDay = weatherByHour.weather.first?.icon.contains("d") else {
            return false
        }
        return isDay
    }

}
