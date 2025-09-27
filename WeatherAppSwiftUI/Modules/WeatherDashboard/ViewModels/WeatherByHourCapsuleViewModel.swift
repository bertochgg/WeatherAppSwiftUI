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
    
    var hour: String {
        weatherByHour.dt.description
    }
    
    var temperature: String {
        String(format: "%.1f", weatherByHour.temp)
    }
}
