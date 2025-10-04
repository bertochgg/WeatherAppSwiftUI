//
//  WeatherByHourViewModel.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 27/09/25.
//
import SwiftUI

@MainActor
final class WeatherByHourViewModel: ObservableObject {
    @Published var capsules: [WeatherByHourCapsuleViewModel] = []
    @Published var isLoading: Bool = false
    @Published var currentCity: String = ""
    @Published var currentTemperature: Double = 0.0
    @Published var weatherDescription: String = ""
    @Published var minTemperature: Double = 0.0
    @Published var maxTemperature: Double = 0.0
    private let weatherNetworkService: WeatherNetworkService
    private let coordinatesByCityNetworkService: CoordinatesByCityNetworkService
    
    init(weatherNetworkService: WeatherNetworkService = WeatherNetworkService(),
         coordinatesByCityNetworkService: CoordinatesByCityNetworkService = CoordinatesByCityNetworkService()) {
        self.weatherNetworkService = weatherNetworkService
        self.coordinatesByCityNetworkService = coordinatesByCityNetworkService
    }
    
    func fetchWeather(for city: String) async {
        isLoading = true
        defer { isLoading = false }
        do {
            let coordinates = try await coordinatesByCityNetworkService.fetchCoordinatesByCity(city)
            let weather = try await weatherNetworkService.fetchWeather(latitude: coordinates.lat, longitude: coordinates.lon)
            self.currentCity = city
            self.currentTemperature = weather.current.temp
            self.weatherDescription = weather.current.weather.first?.description ?? ""
            self.minTemperature = weather.daily.first?.temp.min ?? 0.0
            self.maxTemperature = weather.daily.first?.temp.max ?? 0.0
            self.capsules = weather.hourly.map { WeatherByHourCapsuleViewModel(weatherByHour: $0)}
            if !capsules.isEmpty {
                isLoading = false
            }
        } catch {
            //            throw NetworkErrors.noDataReceived
            
        }
    }
}


