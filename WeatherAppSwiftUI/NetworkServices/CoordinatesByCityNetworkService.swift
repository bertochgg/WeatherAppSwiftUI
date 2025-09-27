//
//  CoordinatesByCityNetworkService.swift
//  WeatherAppSwiftUI
//
//  Created by Cesar Humberto Grifaldo Garcia on 27/09/25.
//
import Foundation

struct CoordinatesByCityNetworkService {
    func fetchCoordinatesByCity(_ city: String) async throws -> CityLocationModel {
        let (data, response): (Data, URLResponse) = try await URLSession.shared.data(from: OpenWeatherAPIEndpoints.getEndpoint(for: .coordinatesByCity(city: city)))
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkErrors.invalidResponse
        }
        guard let location: [CityLocationModel] = try? JSONDecoder().decode([CityLocationModel].self, from: data) else {
            throw NetworkErrors.dataDecodingError
        }
        guard let firstLocation = location.first else {
            throw NetworkErrors.noDataReceived
        }
        return firstLocation
    }
}
