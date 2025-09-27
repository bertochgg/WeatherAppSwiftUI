//
//  WeatherByHourNetworkService.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 27/09/25.
//
import Foundation

struct WeatherNetworkService  {
    func fetchWeather(latitude: Double, longitude: Double) async throws -> OpenWeatherModel {
        let (data, response) = try await URLSession.shared.data(from: OpenWeatherAPIEndpoints.getEndpoint(for: .weatherByLocation(latitude: latitude, longitude: longitude)))
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkErrors.invalidResponse
        }
        guard let weather: OpenWeatherModel = try? JSONDecoder().decode(OpenWeatherModel.self, from: data) else {
            throw NetworkErrors.dataDecodingError
        }
        return weather
    }
}
