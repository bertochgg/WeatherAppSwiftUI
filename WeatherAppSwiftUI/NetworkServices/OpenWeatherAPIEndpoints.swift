//
//  OpenWeatherAPINetworkService.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 27/09/25.
//
import Foundation

enum OpenWeatherAPIEndpoints {
    static let baseURL: String = "https://api.openweathermap.org"
    
    case coordinatesByCity(city: String)
    case weatherByLocation(latitude: Double, longitude: Double)
    
    private var urlPath: String {
        switch self {
        case .coordinatesByCity(let city):
            return "/geo/1.0/direct?q=\(city)&appid=\(Constants.Keys.openWeatherApiKey)"
        case let .weatherByLocation(latitude, longitude):
            return "/data/3.0/onecall?lat=\(latitude)&lon=\(longitude)&appid=\(Constants.Keys.openWeatherApiKey)"
        }
    }
    
    static func getEndpoint(for endpoint: OpenWeatherAPIEndpoints) throws -> URL {
        let endpointPath = baseURL + endpoint.urlPath
        guard let url = URL(string: endpointPath) else {
            throw NetworkErrors.invalidURL
        }
        return url
    }
}
